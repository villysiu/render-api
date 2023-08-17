class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create

    build_resource(sign_up_params)
    resource.save
    sign_in(resource_name, resource)
    resource.update(login_time: resource.current_sign_in_at)
    render json: {id: resource.id, login: resource.login_time.to_i}, status: :ok

  end



end