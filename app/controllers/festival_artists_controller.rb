class FestivalArtistsController < ApplicationController
  
  def index
    @festival = Festival.find(params[:id])
    @artists = @festival.artists
  end
  
end