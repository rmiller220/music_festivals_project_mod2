class FestivalsController < ApplicationController
  def index
    @festivals = Festival.sort_by_most_recent
  end

  def show
    @festivals = Festival.find(params[:id])
  end
end