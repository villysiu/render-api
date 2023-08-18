json.id @current_user.id
json.avatar Rails.application.routes.url_helpers.rails_blob_path(@current_user.avatar, only_path: true) if @current_user.avatar.attached?
json.login @current_user.login_time.to_i