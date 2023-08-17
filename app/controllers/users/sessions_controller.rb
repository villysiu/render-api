class Users::SessionsController < Devise::SessionsController
  respond_to :json
 

  private

  def respond_with(resource, _opts = {})
    resource.update(login_time: resource.current_sign_in_at)
    render json: {id: resource.id, login: resource.login_time.to_i}, status: :ok
  end
 

  def respond_to_on_destroy
    puts "logging out?"
    puts current_user
    render json: { message: "Logged out." }, status: :ok
  end

end