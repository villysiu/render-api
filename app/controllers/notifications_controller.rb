class NotificationsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_user
    def create
        @user.notifications.create!( 
                    from_user_id: current_user.id,
                    post_id: notification_params[:post_id],
                    topic: notification_params[:topic])
       

        
    end

    private

    def notification_params
        params.permit(:topic, :post_user_id)
    end
    def find_user
        @user=User.find(params[:post_user_id])
    end
    
end
