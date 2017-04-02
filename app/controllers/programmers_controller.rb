class ProgrammersController < ApplicationController
  before_action :set_programmer, only: [:show, :edit, :update, :destroy]
  def index
    @programmers = Programmer.all
  end

  def show
    @programmer = Programmer.find(params[:id])
  end

  def new
    @programmer = Programmer.new
  end

  def edit
    @programmer = Programmer.find(params[:id])
  end

  def create
    @programmer = Programmer.new(programmer_params)
    respond_to do |format|
      if @programmer.save
        format.html { redirect_to @programmer,
          notice: 'Programador cadastrado com sucesso.' }
        format.json { render :show, status: :created,
          location: @programmer }
      else
        format.html { render :new }
        format.json { render json: @programmer.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @programmer.update(programmer_params)
        format.html { redirect_to @programmer,
          notice: 'Programador atualizado com sucesso.' }
        format.json { render :show, status: :ok,
          location: @programmer }
      else
        format.html { render :edit }
        format.json { render json: @programmer.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @programmer.destroy
    respond_to do |format|
      format.html { redirect_to programmers_url,
        notice: 'Programador removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def set_programmer
      @programmer = Programmer.find(params[:id])
    end

    def programmer_params
      params.require(:programmer).permit(:name)
    end
end
