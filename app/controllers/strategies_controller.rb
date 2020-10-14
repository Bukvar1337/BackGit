class StrategiesController < ApplicationController
  before_action :find_strategy, only: [:show, :update, :destroy]

  def index
    id = params[:id]
    if id.nil?
      @strategy = Strategy.all
    else
      @strategy = Strategy.where("id = #{params[:id]}")
    end
    render json: @strategy.as_json
  end

  def show
    render json: @strategy.as_json
  end

  def update
    if(@strategy.update(strategy_params))
      render json: @strategy.as_json
    else
      render json: { success: false, errors: @strategy.errors.as_json }, status: :unprocessable_entity
    end
  end

  def destroy
    @strategy.destroy
    redirect_to strategies_path
  end

  def create
    @strategy = Strategy.create(strategy_params)

    if @strategy.save
      render json: @strategy.as_json
    else
      render json: { success: false, errors: @strategy.errors.as_json }, status: :unprocessable_entity
    end
  end

  private def strategy_params
    params.require(:strategy).permit(:name, :strategy_details)
  end

  private def find_strategy
    @strategy = Strategy.find(params[:id])
  end
end
