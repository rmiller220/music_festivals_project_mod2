class FestivalArtistsController < ApplicationController
  
  def index
    @festival = Festival.find(params[:id])
    # require 'pry'; binding.pry
    if params[:sort_by] == 'a-z'
      @artists = @festival.artists.order(:name)
    else
      @artists = @festival.artists
    end
  end
  
  
  def new
    @festival = Festival.find(params[:id])
    # @artist = Artist.all
  end
  
  def create
    festival = Festival.find(params[:id])
    artist = festival.artists.create!({
      name: params[:name],
      performance_day: params[:performance_day],
      explicit_content: params[:explicit_content],
      number_of_performances: params[:number_of_performances],
      festival_appearances: params[:festival_appearances]
    })
    # require 'pry'; binding.pry
    artist.save
    
    redirect_to "/festivals/#{festival.id}/artists"
  end
end