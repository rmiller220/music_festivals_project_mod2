class ArtistsController < ApplicationController
  def index
    @artists = Artist.explicit_true?
  end

  def show
    @artists = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end
  def update
    artist = Artist.find(params[:id])
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

  def destroy
    Artist.destroy(params[:id])
    redirect_to "/artists"
  end
end