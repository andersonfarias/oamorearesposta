class ActivityDiariesController < ApplicationController
    respond_to :html, :xml, :json

    before_action :set_activity_diary, only: [:edit, :update, :show, :destroy]

    def new
        activity = Activity.find(params[:activity_id])
        unless activity.is_active
            redirect_to action: 'index', controller: 'activities', notice: t('errors.messages.cant_change_inactive_activity_diary')
            return
        end
        @activity_diary = ActivityDiary.new(
            diary: Diary.new(user: current_user, date: Date.today.strftime(t('date.formats.default'))),
            activity: activity
        )
        @activity_diary.attendances.build

        page = params.key?(:page) && !params[:page].blank? ? params[:page] : 1
        @activity_diaries = ActivityDiary.by_activity(params[:activity_id]).paginate(page: page)

        render 'new', locals: { attendances: [] }
    end

    def create
        @activity_diary = ActivityDiary.new(activity_diary_params)
        unless @activity_diary.attendances.nil?
            @activity_diary.attendances.each { |a| a.activity_diary = @activity_diary }
        end
        unless @activity_diary.diary.nil?
            @activity_diary.diary.axis = [Diary.axis.education]
        end

        if @activity_diary.save
            @activity_diaries = ActivityDiary.by_activity(params[:activity_id]).paginate(page: params[:page])
            redirect_to action: 'new', activity_id: @activity_diary.activity.id, notice: t('controllers.actions.create.success', model: ActivityDiary.model_name.human(count: 1))
        else
            if @activity_diary.errors.key?(:diary_description_error)
                @activity_diary.diary.errors.add :description, @activity_diary.errors[:diary_description_error][0]
            end

            attendances = []
            if @activity_diary.attendances.empty?
                @activity_diary.attendances << Attendance.new
            else
                @activity_diary.attendances.each { |a| attendances << a }
                @activity_diary.attendances = [Attendance.new]
            end

            @activity_diaries = ActivityDiary.by_activity(params[:activity_id]).paginate(page: params[:page])
            render 'new', notice: @activity_diary.errors, locals: { attendances: attendances }
        end
    end

    def show
    end

    def edit
        @current_page = params[:current_page]
        @activity_diary.diary.date = @activity_diary.diary.date.strftime('%d/%m/%Y')

        attendances = []
        unless @activity_diary.attendances.empty?
            @activity_diary.attendances.each { |a| attendances << a }
        end

        render 'edit', notice: @activity_diary.errors, locals: { attendances: attendances }
    end

    def update
        previous_attendances_ids = []
        @activity_diary.attendances.each { |a| previous_attendances_ids << a.id }

        if @activity_diary.update(activity_diary_params)
            params_attendances_ids = []
            activity_diary_params[:attendances_attributes].each { |item| params_attendances_ids << item[:id] }

            @activity_diary.attendances.each do |a|
                if !params_attendances_ids.include?(a.id.to_s) && previous_attendances_ids.include?(a.id)
                    a.destroy
                end
            end

            redirect_to new_activity_diary_path(activity_id: activity_diary_params[:activity_id], page: params[:activity_diary][:current_page]),
                        notice: t('controllers.actions.update.success', model: ActivityDiary.model_name.human(count: 1))
        else
            attendances = []
            unless @activity_diary.attendances.empty?
                @activity_diary.attendances.each { |a| attendances << a }
            end

            render 'edit', notice: @activity_diary.errors, locals: { attendances: attendances }
        end
    end

    def destroy
        activity_id = @activity_diary.activity.id
        if @activity_diary.destroy
            @activity_diaries = ActivityDiary.by_activity(activity_id).paginate(page: params[:page])
            redirect_to action: 'new', activity_id: activity_id, notice: t('controllers.actions.destroy.success', model: ActivityDiary.model_name.human(count: 1))
        end
    end

    private

    def set_activity_diary
        @activity_diary = ActivityDiary.find(params[:id])
    end

    def activity_diary_params
        args = params.require(:activity_diary).permit(:id, :activity_id, :diary_id, diary: [:id, :date, :description, :user_id], attendances_attributes: [:id, :beneficiary_id, :observation, :_destroy])
        if args.key?(:diary_id)
            diary = Diary.find(args[:diary_id])
            diary.update_attributes(args[:diary])
            args[:diary] = diary
        else
            args[:diary] = Diary.new(args[:diary])
        end

        i = 0
        attendances_attributes = []
        if args.key?(:attendances_attributes)
            args[:attendances_attributes].keys.each do |a|
                add = !args[:attendances_attributes][a][:beneficiary_id].blank? || !args[:attendances_attributes][a][:observation].blank?
                if add
                    attendances_attributes[i] = args[:attendances_attributes][a]
                    i += 1
                end
            end
        end
        args[:attendances_attributes] = attendances_attributes
        args
    end
end
