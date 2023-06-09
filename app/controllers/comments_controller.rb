class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  before_action :find_photo, :only => [:create, :destroy]
  def index

  end

  def create
    comment= @photo.comments.create!(user_id: current_user.id, comment: params[:comment])
    render json: {id: comment.id, user_id: current_user.id, comment: comment.comment}, status: :ok

  end

  def destroy

  end

  private
  # def comment_params
  #   params.permit(:comment)
  # end

  def find_photo
      @photo=Photo.find(params[:photo_id])
  end

end
