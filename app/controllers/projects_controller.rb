class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      format.html do
        if @project.save
          flash[:notice] = "Project has been created."
          redirect_to @project
        else
          flash.now[:error] =  "Project could not be saved."
          render :new
        end
      end
      format.js do
        unless @project.save
          render text: @project.errors.full_messages.join, status: :unprocessable_entity
        end
      end
    end
  end

  def edit
  end

  def show
    @project = Project.find(params[:id])
    @image = @project
    @commentable = @project
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      respond_to do |format|
        format.html do
          flash[:notice] = "Project was successfully deleted"
          redirect_to projects_path
        end
      end
    end
  end

private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :technologies_used, :image)
  end
end
