class BeneficiaryPolicy
  attr_reader :user, :department

  def initialize(user, department)
    @current_user = user
    @department = department
  end

  def new?
		@current_user.admin?
	end

  def create?
    @current_user.admin?
  end

  def edit?
		@current_user.admin?
	end

  def update?
		@current_user.admin?
	end

  def destroy?
		@current_user.admin?
	end

end
