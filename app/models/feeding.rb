class Feeding < ActiveRecord::Base
	has_one :dependent_variable
end
