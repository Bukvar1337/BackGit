class RiskProbabilityLevelsController < ApplicationController
    before_action :find_risk_probability_level, only: [:show, :update, :destroy]

    def index
      id = params[:id]
      if id.nil?
        @risk_probability_level = RiskProbabilityLevel.all
      else
        @risk_probability_level = RiskProbabilityLevel.where("id = #{params[:id]}")
      end
      render json: @risk_probability_level.as_json
    end

    def show
      render json: @risk_probability_level.as_json
    end

    def update
      if(@risk_probability_level.update(risk_probability_level_params))
        render json: @risk_probability_level.as_json
      else
        render json: { success: false, errors: @risk_probability_level.errors.as_json }, status: :unprocessable_entity
      end
    end

    def destroy
      @risk_probability_level.destroy
      redirect_to risk_probability_levels_path
    end

    def create
      @risk_probability_level = RiskProbabilityLevel.create(risk_probability_level_params)

      if @risk_probability_level.save
        render json: @risk_probability_level.as_json
      else
        render json: { success: false, errors: @risk_probability_level.errors.as_json }, status: :unprocessable_entity
      end
    end

    private def risk_probability_level_params
      params.require(:risk_probability_level).permit(:name, :risk_probability_level_details)
    end

    private def find_risk_probability_level
      @risk_probability_level = RiskProbabilityLevel.find(params[:id])
    end
  end

