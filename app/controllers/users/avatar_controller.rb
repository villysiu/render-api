class Users::AvatarController < ApplicationController
  before_action :authenticate_user!

  def create
  end

  def update
    puts params
    current_user.update(avatar: params[:avatar]) 
    avatar_path=rails_blob_path(current_user.avatar, only_path: true) if current_user.avatar.attached?
   
    render json: {id: current_user.id, avatar: avatar_path}, status: :ok
  end

  def destroy
    current_user.avatar.purge
    current_user.update(avatar: nil)
    render json: {id: current_user.id}, status: :ok
  end

  private

  # def avatar_params
  #   params.permit(:avatar)
  # end
    
end
