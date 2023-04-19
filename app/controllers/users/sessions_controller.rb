class Users::SessionsController < Devise::SessionsController
  respond_to :json
  
  private

  def respond_with(resource, _opts = {})
  puts "DDDDDEEVEVEVNEMAKKDFSJJSKFSHFKJHJSFHJLSKFHSFJHJSKFHSKFHSKJFH"
  puts ENV['DEVISE_JWT_SECRET_KEY']
    render json: resource.id
  end
 

  def respond_to_on_destroy
    render json: { message: "Logged out." }
  end

end