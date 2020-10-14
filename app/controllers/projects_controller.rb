class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update, :destroy]

  def index
    id = params[:id]
    if id.nil?
      @project = Project.all
    else
      @project = Project.where("id = #{id}").first
    end
    @p1 = Project.find(1)
    @p2 = Project.find(2)
    render json: [@p1.as_json(only: :name),@p2.as_json(only: :name)]
  end

  def show
    render json: @project.as_json
  end

  def update
    if(@project.update(project_params))
      render json: @project.as_json
    else
      render json: { success: false, errors: @project.errors.as_json }, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def create
    @project = Project.create(project_params)

    if @project.save
      render json: @project.as_json
    else
      render json: { success: false, errors: @project.errors.as_json }, status: :unprocessable_entity
    end
  end

  private def project_params
    params.require(:project).permit(:name, :project_details)
  end

  private def find_project
    @project = Project.find(params[:id])
  end
end

