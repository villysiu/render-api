class PhotosController < ApplicationController
    before_action :authenticate_user!, :except => [:index]
    before_action :find_photo, :only => [:update, :destroy]
    
    def index
        @photos = Photo.all.order("created_at DESC")

        
    end
    def create
        puts photo_params
        # @photo = Photo.create!(user_id: current_user.id, photo_params)
        @photo = current_user.photos.create!(url: photo_params[:url])
        comment = @photo.comments.create!(user_id: current_user.id, comment: photo_params[:desc])
        puts comment.comment

        @photo.update(comment_id: comment.id)
        @current_user=current_user

        puts @photo.comments.first
    end

    def update
        @photo.update!(desc: params[:desc])
        render json: nil, status: :ok
       
    end
    def destroy
        @photo.url.purge
        @photo.destroy
        render json: nil, status: :ok
    end

    private

    def photo_params
        params.permit(:desc, :url)
    end
    def find_photo
        puts params
        @photo=Photo.find(params[:id])
    end
    

    
end
