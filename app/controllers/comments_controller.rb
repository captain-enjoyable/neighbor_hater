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
    @location = Location.find(params[:address_id])
    @comment = @location.comments.new(comment_attributes)

    if @comment.save
      redirect_to address_url(@location), notice: "Comment created"
    else
      render :new
    end
  end

  private

  def comment_attributes
    params.require(:comment).permit(:body, :headline)
  end
end