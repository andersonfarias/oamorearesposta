class DepartmentPolicy
    attr_reader :user, :department

    def initialize(user, department)
        @current_user = user
        @department = department
    end

    def index?
				active_and_admin_or_coordinator @current_user
    end

    def show?
				active_and_admin_or_coordinator @current_user
    end

    def new?
        active_and_admin_or_coordinator @current_user
    end

    def create?
        active_and_admin_or_coordinator @current_user
    end

    def edit?
        active_and_admin_or_coordinator @current_user
    end

    def update?
        active_and_admin_or_coordinator @current_user
    end

    def destroy?
        active_and_admin_or_coordinator @current_user
    end

    private

    def active_and_admin_or_coordinator user
        user.is_active && (user.admin? || user.coordinator?)
    end

end
