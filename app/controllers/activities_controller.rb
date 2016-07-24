class ActivitiesController < ApplicationController
    respond_to :html, :xml, :json

    before_action :set_activity, only: [:show, :edit, :update, :destroy]

    def index
        @activities = Activity.by_name_and_status(params).paginate(page: params[:page])
    end

    def show
    end

    def new
        @activity = Activity.new
    end

    def create
        @activity = Activity.new(activity_params)
        if @activity.save
            redirect_to @activity, notice: t('controllers.actions.create.success', model: Activity.model_name.human(count: 1))
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @activity.update(activity_params)
            redirect_to @activity, notice: t('controllers.actions.update.success', model: Activity.model_name.human(count: 1))
        end
    end

    def destroy
        @activity.is_active = false
        if @activity.save
            redirect_to activities_path, notice: t('controllers.actions.destroy.success', model: Activity.model_name.human(count: 1))
        end
    end

    private

    def set_activity
        @activity = Activity.find(params[:id])
    end

    def activity_params
        params.require(:activity).permit(:id, :name, :description, :department_id, :axis)
    end
end
