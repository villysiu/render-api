class FollowersController < ApplicationController
    before_action :authenticate_user!, :except => [:index]
    before_action :find_user
    def create
        @user.followers << current_user
        # render json: {user: @user}, status: :ok
    end
    def unfollow
        follow = Follower.find_by(user_id: params[:user_id] , follower_id: current_user.id )
        follow.destroy
        render json: nil, status: :ok
    end
    def remove
        follow = Follower.find_by(user_id: current_user.id, follower_id: params[:user_id])
        follow.destroy
        render json: nil, status: :ok
    end
    private

   
    def find_user
        @user=User.find(params[:user_id])
    end
end
