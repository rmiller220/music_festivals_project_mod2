class FestivalArtistsController < ApplicationController
  
  def index
    @festival = Festival.find(params[:id])
    @artists = @festival.artists
  end

  def new
    @festival = Festival.find(params[:id])
    @artist = Artist.all
  end
  
  def create
    festival = Festival.find(params[:id])
    artist = Artist.new({
      name: params[:name],
      performance_day: params[:performance_day],
      explicit_content: params[:explicit_content],
      number_of_performances: params[:number_of_performances],
      festival_appearances: params[:festival_appearances]
    })

    artist.save
    
    redirect_to "/festivals/#{festival.id}/artists"
  end
end