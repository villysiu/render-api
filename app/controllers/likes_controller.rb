class LikesController < ApplicationController
    before_action :authenticate_user!, :except => [:index]
    before_action :find_photo
    
    def index
        # @likes=@photo.likes
    end
    def create
        @like= @photo.likes.create!(user_id: current_user.id)
        render json: {id: @like.id, user_id: @like.user_id}, status: :ok
    end

    def destroy
        @like=@photo.likes.find_by(user_id: current_user.id)
        @like.destroy
        render json: @like.id, status: :ok
    end

    private

    def find_photo
        @photo=Photo.find(params[:photo_id])
    end

    

end
