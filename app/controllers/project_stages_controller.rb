class ProjectStagesController < ApplicationController
  before_action :find_project_stage, only: [:show, :update, :destroy]

  def index
    id = params[:id]
    if id.nil?
      @project_stage = ProjectStage.all
    else
      @project_stage = ProjectStage.where("id = #{params[:id]}")
    end
    render json: @project_stage.as_json
  end

  def show
    render json: @project_stage.as_json
  end

  def update
    if(@project_stage.update(project_stage_params))
      render json: @project_stage.as_json
    else
      render json: { success: false, errors: @project_stage.errors.as_json }, status: :unprocessable_entity
    end
  end

  def destroy
    @project_stage.destroy
    redirect_to project_stages_path
  end

  def create
    @project_stage = ProjectStage.create(project_stage_params)

    if @project_stage.save
      render json: @project_stage.as_json
    else
      render json: { success: false, errors: @project_stage.errors.as_json }, status: :unprocessable_entity
    end
  end

  private def project_stage_params
    params.require(:project_stage).permit(:name, :project_stage_details)
  end

  private def find_project_stage
    @project_stage = ProjectStage.find(params[:id])
  end
end
