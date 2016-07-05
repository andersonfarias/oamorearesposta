class ComunitiesController < ApplicationController

  before_action :set_comunity, only: [:show]

  def index
    @comunities = Comunity.all
    @locais = [
      { lat: -5.077236803442222, lng: -42.78968811035156},
      { lat: -5.079993969781045, lng: -42.7932071685791},
      { lat: -5.0806280496704215, lng: -42.80067443847656},
      { lat: -5.081995943661709, lng: -42.7972412109375},
      { lat: -5.085415665932124, lng: -42.80204772949219}
    ]
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
