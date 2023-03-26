class FestivalsController < ApplicationController
  def index
    @festivals = Festival.sort_by_most_recent
  end

  def show
    @festival = Festival.find(params[:id])
    @artists = @festival.artists
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

  def edit
    @festival = Festival.find(params[:id])
  end

  def update
    festival = Festival.find(params[:id])
    festival.update({
      name: params[:festival][:name],
      city: params[:festival][:city],
      kid_friendly: params[:festival][:kid_friendly],
      ticket_price: params[:festival][:ticket_price],
      dates: params[:festival][:ticket_price],
      rv_hookup: params[:festival][:rv_hookup]
    })
    festival.save
    redirect_to "/festivals/#{festival.id}"
  end
end