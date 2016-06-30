class CitiesController < ApplicationController
	autocomplete :city, :name, {:display_value => 'name_with_state_acronym', :full_model=>true}
end