class ProjectRisksController < ApplicationController
  before_action :find_project_risk, only: [:show, :update, :destroy, :something]

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
    #@project_risk = ProjectRisk.find(params[:id])
    @term = params[:term]
    @delay = @project_risk.delay
    @projects = Project.where(["id LIKE ?", "%#{@project_risk.project_id}%"]).first
    @avg = @project.avg_team_cost
    @risk_probability_level = RiskProbabilityLevel.where(["id LIKE ?",
                                                          "%#{@project_risk.risk_probability_level_id}%"]).first
    @probability = @risk_probability_level.probability
    @user = User.where(["id LIKE ?", "%#{@project.user_id}%"]).first
    @experience_level = ExperienceLevel.where(["id LIKE ?", "%#{@user.experience_level_id}%"]).first
    @k_term = ProjectTermCoef.where("range_from <= #{@term}").where("range_to => #{@term}")
    @k_competence = @experience_level.coef
    @k_norm = NormalizationFactor.first.coef
    @risk_status = RiskStatus.where(["id LIKE ?", "%#{@project_risk.risk_status_id}%"]).first
    @k_status = @risk_status.coef

    @losses = @delay*@avg
    @probable_losses = (@losses*@probability/100*@k_term*@k_competence)/@k_norm*@k_status

    render json: [@probable_losses.as_json, @risk_probability_level.as_json(only: :name),
                  @risk_status.as_json(only: :name)]
  end

  private def project_risk_params
    params.require(:project_risk).permit(:name, :project_risk_details)
  end

  private def find_project_risk
    @project_risk = ProjectRisk.find(params[:id])
  end
end
