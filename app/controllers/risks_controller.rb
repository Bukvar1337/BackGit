class RisksController < ApplicationController
  before_action :find_risk, only: [:show, :update, :destroy]

  def index
    id = params[:id]
    if id.nil?
      @risk = Risk.all
    else
      @risk = Risk.where("id = #{params[:id]}")
    end
    render json: @risk.as_json
  end

  def show
    render json: @risk.as_json
  end

  def update
    if(@risk.update(risk_params))
      render json: @risk.as_json
    else
      render json: { success: false, errors: @risk.errors.as_json }, status: :unprocessable_entity
    end
  end

  def destroy
    @risk.destroy
    redirect_to risks_path
  end

  def create
    @risk = Risk.create(risk_params)

    if @risk.save
      render json: @risk.as_json
    else
      render json: { success: false, errors: @risk.errors.as_json }, status: :unprocessable_entity
    end
  end

  private def risk_params
    params.require(:risk).permit(:name, :risk_details)
  end

  private def find_risk
    @risk = Risk.find(params[:id])
  end
end
