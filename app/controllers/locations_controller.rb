class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    param = Address.normalize(params).as_params_hash
    if LocationUniquenessValidator.new(param).unique?
      @location = Location.new(param)
      if @location.save
        redirect_to @location, :notice => "Successfully created location."
      else
        render :action => 'new'
      end
    else
      location = Location.where(param).take
      redirect_to "/locations/#{location.id}"
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      redirect_to @location, :notice  => "Successfully updated location."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_url, :notice => "Successfully destroyed location."
  end
end
