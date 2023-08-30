class FollowersController < ApplicationController
    before_action :authenticate_user!, :except => [:index]
    before_action :find_user
    def create
        puts "hehe"
        @user.followers << current_user
        render json: {curr_user_id: current_user.id}, status: :ok
    end

    private

   
    def find_user
        @user=User.find(params[:user_id])
    end
end
