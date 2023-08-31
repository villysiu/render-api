json.id @user.id
json.avatar Rails.application.routes.url_helpers.rails_blob_path(@user.avatar, only_path: true) if @user.avatar.attached?
json.name @user.name
json.email @user.email
json.bio @user.bio

json.followers @user.followers do |follower|
    json.partial! 'users/user/user', user: follower
end
json.followings @user.inverse_followers do |following|
    json.partial! 'users/user/user', user: following
end