class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    # require 'pry'; binding.pry
    @artists = Artist.find(params[:id])
  end
end