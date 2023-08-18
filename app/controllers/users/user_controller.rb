class Users::UserController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show, :check_email]

  def index
    # @users=User.all
  end

  def curr_user
      # puts "HAHAHHAHAHAHAHAHAHHAHA"
     @current_user = current_user
      # render json: {id: current_user.id, 
      # avatar: rails_blob_path(current_user.avatar, only_path: true) if current_user.avatar.attached?,
      # login: current_user.login_time.to_i}, status: :ok
  end

  def check_email
    
    @user=User.find_by(email: user_params[:email])
    
    if @user
      render json:{existed: 1} , status: :ok
    else
      render json:{existed: 0} , status: :ok
    end
  end

  def update
    current_user.update(user_params)
    render json: current_user, except: :avatar, status: :ok
  end

  def show
    @user=User.find(params[:id])  
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :bio, :email)
  end
    
end
