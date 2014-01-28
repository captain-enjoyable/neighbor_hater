class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(params[:address])

    if @address.valid?
      redirect_to @address.to_canonical
    else
      render :new
    end
  end
end
