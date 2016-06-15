class Department < ActiveRecord::Base
  has_many :beneficiaries
end
