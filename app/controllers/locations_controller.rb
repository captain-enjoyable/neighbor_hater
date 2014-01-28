class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:id])
    @comment  = Comment.new
  end
end