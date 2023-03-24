class FestivalArtistsController < ApplicationController
  def index
    
    @festival = Festival.find(params[:id])
    # require 'pry'; binding.pry
    @artists = @festival.artists
  end
end