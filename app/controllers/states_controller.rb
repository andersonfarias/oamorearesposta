class StatesController < ApplicationController
  def index
    @states = State.all.paginate(:page => params[:page], :per_page => 10)
  end
end
