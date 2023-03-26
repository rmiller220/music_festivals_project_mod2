class FestivalsController < ApplicationController
  def index
    @festivals = Festival.sort_by_most_recent
  end

  def show
    @festivals = Festival.find(params[:id])
    @artists = @festivals.artists
  end

  def new

  end

  def create
    festival = Festival.new({
      name: params[:festival][:name],
      city: params[:festival][:city],
      kid_friendly: params[:festival][:kid_friendly],
      ticket_price: params[:festival][:ticket_price],
      dates: params[:festival][:ticket_price],
      rv_hookup: params[:festival][:rv_hookup]
    })

    festival.save 

    redirect_to "/festivals"
  end
end