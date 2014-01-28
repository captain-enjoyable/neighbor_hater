class CommentsController < ApplicationController
  def index
    @comments = Comments.all
  end

  def show
  end

  def new
    @address = Address.new
  end

  def create
  	raise params.inspect
    @address = Address.new(params[:address])

    if @address.valid?
      redirect_to address_url(@address.to_canonical)
    else
      render :new
    end
  end
end