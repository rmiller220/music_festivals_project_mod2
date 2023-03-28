class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    # require 'pry'; binding.pry
    @artists = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end
  def update
    artist = Artist.find(params[:id])
    # require 'pry'; binding.pry
    artist.update({
      name: params[:name],
      explicit_content: params[:explicit_content],
      performance_day: params[:performance_day],
      number_of_performances: params[:number_of_performances],
      festival_appearances: params[:festival_appearances]
    })
    artist.save

    redirect_to "/artists/#{artist.id}"
  end
end