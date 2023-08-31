json.id current_user.id
json.name current_user.name
json.avatar Rails.application.routes.url_helpers.rails_blob_path(current_user.avatar, only_path: true) if current_user.avatar.attached?
json.login current_user.login_time.to_i

json.followers current_user.followers do |follower|
    json.partial! 'users/user/user', user: follower
end
json.followings current_user.inverse_followers do |following|
    json.partial! 'users/user/user', user: following
end

#json.notifications current_user.notifications do |notification|
#    json.partial! 'notifications/notification', notification: notification
#end
