json.id current_user.id
json.name current_user.name
json.avatar Rails.application.routes.url_helpers.rails_blob_path(current_user.avatar, only_path: true) if current_user.avatar.attached?
json.login current_user.login_time.to_i

json.notifications current_user.notifications do |notification|
    json.partial! 'notifications/notification', notification: notification
end