class PhotosController < ApplicationController
    before_action :authenticate_user!, :except => [:index, :fetch_posts, :fetch_user_posts, :post_count]
    before_action :find_photo, :only => [:update, :destroy]
    
    def index
        @photos = Photo.all.order("created_at DESC").first(5)
        
    end
    def fetch_posts 
        @photos = Photo.all.order("created_at DESC").slice(params[:idx],5)
        
    end
    def fetch_user_posts 
        user = User.find(params[:user_id])
        @photos = user.photos.order("created_at DESC")
        
    end
    def post_count 
        render json: {count: Photo.all.length()}, status: :ok
    end
    def create
        @photo = current_user.photos.create!(url: photo_params[:url])
        
        comment = @photo.comments.create!(user_id: current_user.id, comment: photo_params[:desc])
     
        @photo.update(comment_id: comment.id)
        @current_user=current_user

        
    end

    def update
        # @photo.update!(desc: params[:desc])
        comment = Comment.find(@photo.comment_id)
        comment.update!(comment: params[:desc])
        render json: nil, status: :ok
       
    end
    def destroy
        @photo.url.purge
        @photo.destroy
        render json: nil, status: :ok
    end

    private

    def photo_params
        params.permit(:desc, :url, :idx)
    end
    def find_photo
        puts params
        @photo=Photo.find(params[:id])
    end
    

    
end
