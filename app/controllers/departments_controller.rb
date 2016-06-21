class DepartmentsController < ApplicationController
  respond_to :html, :xml, :json

  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.all.paginate( :page => params[ :page ] )
  end

  def show
  end

  def new
    @department = Department.new
  end

  def create
    authorize current_user
    @department = Department.new(department_params)
    if @department.save
      redirect_to @department, notice: 'Criado com sucesso.'
    end
  end

  def edit
  end

  def update
    authorize current_user
    if @department.update(department_params)
      redirect_to @department, notice: 'Atualizado com sucesso.'
    end
  end

  def destroy
    if @department.destroy
      redirect_to departments_path, notice: 'Deletado com sucesso.'
    end
  end

  private
  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name, :description)
  end
end
