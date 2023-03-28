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
    # require 'pry'; binding.pry
    festival = Festival.new({
      name: params[:name],
      city: params[:city],
      kid_friendly: params[:kid_friendly],
      ticket_price: params[:ticket_price],
      dates: params[:ticket_price],
      rv_hookup: params[:rv_hookup]
    })

    festival.save 

    redirect_to "/festivals"
  end

  def edit
    @festival = Festival.find(params[:id])
  end

  def update
    festival = Festival.find(params[:id])
    # require 'pry'; binding.pry
    festival.update({
      name: params[:name],
      city: params[:city],
      kid_friendly: params[:kid_friendly],
      ticket_price: params[:ticket_price],
      dates: params[:festival_dates],
      rv_hookup: params[:rv_hookup]
    })
    festival.save
    redirect_to "/festivals/#{festival.id}"
  end

  
end