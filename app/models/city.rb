class City < ActiveRecord::Base
  belongs_to :state
  has_many :addresses

  def name_with_state_acronym
    "#{name}/#{state.acronym}"
  end
end
