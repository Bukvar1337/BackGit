class RiskStatusesController < ApplicationController
  before_action :find_risk_status, only: [:show, :update, :destroy]

  def index
    id = params[:id]
    if id.nil?
      @risk_status = RiskStatus.all
    else
      @risk_status = RiskStatus.where("id = #{params[:id]}")
    end
    render json: @risk_status.as_json
  end

  def show
    render json: @risk_status.as_json
  end

  def update
    if(@risk_status.update(risk_status_params))
      render json: @risk_status.as_json
    else
      render json: { success: false, errors: @risk_status.errors.as_json }, status: :unprocessable_entity
    end
  end

  def destroy
    @risk_status.destroy
    redirect_to risk_statuses_path
  end

  def create
    @risk_status = RiskStatus.create(risk_status_params)

    if @risk_status.save
      render json: @risk_status.as_json
    else
      render json: { success: false, errors: @risk_status.errors.as_json }, status: :unprocessable_entity
    end
  end

  private def risk_status_params
    params.require(:risk_status).permit(:name, :risk_status_details)
  end

  private def find_risk_status
    @risk_status = RiskStatus.find(params[:id])
  end
end
