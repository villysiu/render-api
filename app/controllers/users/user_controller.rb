class Users::UserController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @users=User.all
  end

  def curr_user
      render json: current_user.id, status: :ok
  end

  def update
    current_user.update(user_params)
    render json: current_user.id, status: :ok
  end

  def show
    @user=User.find(params[:id])  
  end

  private
  
  def user_params
    params.permit(:name, :bio)
  end
    
end
