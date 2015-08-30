class ProjectsController < ApplicationController

  def index
    render json: Project.all
  end

  def show
    render json: set_project
  end

  private
  
  def set_project
    Project.find(params[:id])
  end

end
