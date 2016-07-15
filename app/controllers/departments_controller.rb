class DepartmentsController < ApplicationController
    respond_to :html, :xml, :json

    before_action :set_department, only: [:show, :edit, :update, :destroy]

    def index
        authorize current_user
        @departments = Department.by_name_and_status(params).paginate(page: params[:page])
    end

    def show
        authorize @department
    end

    def new
        authorize @department = Department.new
    end

    def create
        @department = Department.new(department_params)
        authorize @department
        if @department.save
            redirect_to @department,
                        notice: t('controllers.actions.create.success', model: Department.model_name.human(count: 1))
        end
    end

    def edit
        authorize @department
    end

    def update
        authorize @department
        if @department.update(department_params)
            redirect_to @department,
                        notice: t('controllers.actions.update.success', model: Department.model_name.human(count: 1))
        end
    end

    def destroy
        authorize @department
        @department.is_active = false
        if @department.save()
            redirect_to departments_path,
                        notice: t('controllers.actions.destroy.success', model: Department.model_name.human(count: 1))
        end
    end

    private

    def set_department
        @department = Department.find(params[:id])
    end

    def department_params
        params.require(:department).permit(:name, :description, :is_active)
    end
end
