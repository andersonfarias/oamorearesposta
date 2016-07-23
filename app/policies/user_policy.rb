class UserPolicy
    attr_reader :current_user, :record

    def initialize(current_user, record)
        @current_user = current_user
        @record = record
    end

    def index?
				active_and_admin_or_coordinator @current_user
    end

    def show?
				active_and_admin_or_coordinator(@current_user) || @current_user == @record
    end

    def update?
        active_and_admin_or_coordinator(@current_user) || @current_user == @record
    end

    def destroy?
        return false if @current_user == @user
        active_and_admin_or_coordinator(@current_user) || @current_user == @record
    end

    def new?
        active_and_admin_or_coordinator(@current_user) || @current_user == @record
    end

    def create?
        active_and_admin_or_coordinator(@current_user) || @current_user == @record
    end

    def change_user?
				active_and_admin_or_coordinator(@current_user) || @current_user == @record
    end

    def edit?
      active_and_admin_or_coordinator(@current_user)
    end

		private

		def active_and_admin_or_coordinator user
				user.is_active && (user.admin? || user.coordinator?)
		end

end
