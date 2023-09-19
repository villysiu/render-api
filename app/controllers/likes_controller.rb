class LikesController < ApplicationController
    before_action :authenticate_user!, :except => [:index]
    before_action :find_comment
    
    def index
        # @likes=@photo.likes
    end
    def create
        @like= @comment.likes.create!(user_id: current_user.id)
        # render nil, status: :ok
        @current_user = current_user
        # render json: {user_id: current_user.id, user_name: current_user.name}, status: :ok
    end

    def destroy
        @like=@comment.likes.find_by(user_id: current_user.id)
        @like.destroy
        render json: nil, status: :ok
    end

    private

    # def find_photo
    #     @photo=Photo.find(params[:photo_id])
    # end
    def find_comment
        @comment=Comment.find(params[:comment_id])
    end

    

end
