class Api::V1::CommentsController < Api::V1::ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_filter :confirm_phone!, except: [:index]

  def index
    @comments = resource_image.comments
    respond_with(@comments, location: nil)
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.image = resource_story
    @comment.user = current_user
    @comment.save
    respond_with(@comment, location: nil)
  end

  def destroy
    @comment = resource_story.comments.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      respond_with(@comments, location: nil)
    else
      render json: {error: 'It isnt your comment!'}, status: 422
    end
  end

  private

  def resource_image
    Image.find(params[:image_id])
  end

end