class FirstContactFile < ActiveRecord::Base
  belongs_to :beneficiary
  belongs_to :user
  has_one :contact_source, class_name => "Person"
  has_one :support, class_name => "Person"
end
