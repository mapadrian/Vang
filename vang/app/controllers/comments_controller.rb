class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @picture = Picture.find(params[:picture_id]) #finds the picture with the associated picture_id
    @comment = @picture.comments.create(comment_params) #creates the comment on the picture passing in params
    @comment.user_id = current_user.id if current_user # assigns logged in user's ID to comment
    @comment.save!

    redirect_to picture_path(@picture)
  end

  def destroy
    @picture = Pcture.find(params[:picture_id])
    @comment = @picture.comments.find(params[:id])
    @comment.destroy
    redirect_to picture_path(@picture)
  end
  private
  def comment_params
    params.require(:comment).permit(:name, :response)
  end
end
