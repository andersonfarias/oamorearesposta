class City < ActiveRecord::Base
  belongs_to :state, inverse_of: :cities
  has_many :addresses, inverse_of: :city

  validates_presence_of :state
  validates_associated :state

  def name_with_state_acronym
    "#{name}/#{state.acronym}"
  end
end
