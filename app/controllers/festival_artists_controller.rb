class FestivalArtistsController < ApplicationController
  
  def index
    @festival = Festival.find(params[:id])
  end
  
end