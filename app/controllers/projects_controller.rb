class ProjectsController < ApplicationController
  before_action :set_project, only:[:show, :edit, :update, :destroy]
  before_action :set_programmers, only:[:new, :edit]
  before_action :set_clients, only:[:new, :edit, :create, :update]
  def index
    @projects = Project.all
  end
  def show
  end
  def new
    @project = Project.new
  end
  def edit
  end
  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project,
          notice: 'Projeto cadastrado com sucesso.' }
        format.json { render :show, status: :created,
          location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors,
          status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project,
          notice: 'Projecto atualizado com sucesso.' }
        format.json { render :show, status: :ok,
          location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors,
          status: :unprocessable_entity }
      end
    end
  end
  private
    def set_programmers
      @programmers = Programmer.all
    end
    def set_clients
      @clients = Client.all
    end

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:description, :client_id, :programmer_id)
    end
end
