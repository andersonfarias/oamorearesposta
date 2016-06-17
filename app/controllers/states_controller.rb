class StatesController < ApplicationController
	def index
		@states = State.all.paginate(:page => params[:page])
	end
end