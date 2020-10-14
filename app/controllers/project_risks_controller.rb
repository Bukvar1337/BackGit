class ProjectRisksController < ApplicationController
  before_action :find_project_risk, only: [:show, :update, :destroy]

  def index
    id = params[:id]
    if id.nil?
      @project_risk = ProjectRisk.all
    else
      @project_risk_risk = ProjectRisk.where("id = #{params[:id]}")
    end
    render json: @project_risk.as_json
  end

  def show
    render json: @project_risk.as_json
  end

  def update
    if(@project_risk.update(project_risk_params))
      render json: @project_risk.as_json
    else
      render json: { success: false, errors: @project_risk.errors.as_json }, status: :unprocessable_entity
    end
  end

  def destroy
    @project_risk.destroy
    redirect_to project_risks_path
  end

  def create
    @project_risk = ProjectRisk.create(project_risk_params)

    if @project_risk.save
      render json: @project_risk.as_json
    else
      render json: { success: false, errors: @project_risk.errors.as_json }, status: :unprocessable_entity
    end
  end

  def calculator
    # Передаваемые параметры
    term = params[:term]
    id = params[:id]
    # Запросы в БД для поиска объектов
    # Не справочники
    project_risk = ProjectRisk.find(id)
    project = Project.find(project_risk.project_id)
    user = User.find(project.user_id)
    # Справочники
    risk_status = RiskStatus.find(project_risk.risk_status_id)
    risk_probability_level = RiskProbabilityLevel.find(project_risk.risk_probability_level_id)
    experience_level = ExperienceLevel.find(user.experience_level_id)
    project_term_coef = ProjectTermCoef.where("range_from <= #{term}").where("range_to >= #{term}").first
    normalization_factor = NormalizationFactor.first
    # Вытягиваемые данные
    delay = project_risk.delay
    avg = project.avg_team_cost
    probability = risk_probability_level.probability
    k_term = project_term_coef.coef
    k_competence = experience_level.coef
    k_norm = normalization_factor.coef
    k_status = risk_status.coef
    # Расчёты
    losses = delay*avg
    probable_losses = (losses*probability/100*k_term*k_competence*k_status)/k_norm

    render json: [probable_losses.as_json, risk_probability_level.as_json(only: :name),
                  risk_status.as_json(only: :name)]
  end

  private def project_risk_params
    params.require(:project_risk).permit(:name, :project_risk_details)
  end

  private def find_project_risk
    @project_risk = ProjectRisk.find(params[:id])
  end
end
