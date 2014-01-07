class NeighborsController < ApplicationController
  before_action :set_neighbor, only: [:show, :edit, :update, :destroy]

  # GET /neighbors
  # GET /neighbors.json
  def index
    @neighbors = Neighbor.all
  end

  # GET /neighbors/1
  # GET /neighbors/1.json
  def show
    # if neighbor exists then show it else redirect to create
  end

  # GET /neighbors/new
  def new
    @neighbor = Neighbor.new
  end

  # GET /neighbors/1/edit
  def edit
  end

  # POST /neighbors
  # POST /neighbors.json
  def create
    @neighbor = Neighbor.new(neighbor_params)
    respond_to do |format|
      if @neighbor.save
        format.html { redirect_to @neighbor, notice: 'Neighbor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @neighbor }
      else
        format.html { render action: 'new' }
        format.json { render json: @neighbor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /neighbors/1
  # PATCH/PUT /neighbors/1.json
  def update
    respond_to do |format|
      if @neighbor.update(neighbor_params)
        format.html { redirect_to @neighbor, notice: 'Neighbor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @neighbor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /neighbors/1
  # DELETE /neighbors/1.json
  def destroy
    @neighbor.destroy
    respond_to do |format|
      format.html { redirect_to neighbors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neighbor
      @neighbor = Neighbor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def neighbor_params
      params.require(:neighbor).permit(:address, :rating)
    end
end
