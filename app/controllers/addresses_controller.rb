class AddressesController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(params[:address])

    if @address.valid?
      redirect_to address_url(@address.to_canonical)
    else
      render :new
    end
  end
end
