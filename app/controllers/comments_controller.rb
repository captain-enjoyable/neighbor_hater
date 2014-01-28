class CommentsController < ApplicationController
  def create
    @location = Location.find(params[:location_id])
    @comment = @location.comments.new(comment_attributes)

    if @comment.save
      redirect_to @location, notice: "Comment created"
    else
      render "locations/show"
    end
  end

  private

  def comment_attributes
    params.require(:comment).permit(:body, :headline)
  end
end