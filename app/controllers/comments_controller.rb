class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  before_action :find_photo, :only => [:create, :destroy]
  def index

  end

  def create
    @comment= @photo.comments.create!(user_id: current_user.id, comment: params[:comment])
    @current_user = current_user

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
