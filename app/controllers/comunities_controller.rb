class ComunitiesController < ApplicationController

  before_action :set_comunity, only: [:show]

  def index
    @comunities = Comunity.all
  end

  def show
  end

  def new
    @comunity = Comunity.new
  end

  def create
  end

  def set_comunity
    @comunity = Comunity.find(params[:id])
  end
end
