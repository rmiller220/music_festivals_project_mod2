class FestivalsController < ApplicationController
  def index
    @festivals = Festival.all 
  end

  def show
    @festivals = Festival.find(params[:id])
    # require 'pry'; binding.pry
  end
end