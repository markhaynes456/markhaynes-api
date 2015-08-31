class ProjectsController < ApplicationController

  before_filter :set_headers
  skip_before_filter :verify_authenticity_token

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

 def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Expose-Headers'] = 'ETag'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
    headers['Access-Control-Max-Age'] = '86400'
 end
end
