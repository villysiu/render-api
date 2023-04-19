class Users::UserController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  # before_action :find_current_user, :except => [:index, :show]

  def index
    @users=User.all
  end

  def curr_user
      render json: "someone here?? "
      # render json: current_user.id, except: [:created_at, :updated_at]
      , status: :ok
    
  end

  def update
    
    current_user.update(name: params[:name]) 
    current_user.update(bio: params[:bio]) 
    render json: current_user.id
    # , except: [:created_at, :updated_at]
    , status: :ok
  end

  def show
    @user=User.find(params[:id])  
  end

  private
  def avatar_params
    params.permit(:name, :bio )
  end
    
end
