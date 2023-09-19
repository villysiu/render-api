json.id user.id
json.name user.name
json.avatar Rails.application.routes.url_helpers.rails_blob_path(user.avatar, only_path: true) if user.avatar.attached?
json.photos user.photos.last(3) do |photo|
    json.id photo.id
    json.url Rails.application.routes.url_helpers.rails_blob_path(photo.url, only_path: true) if photo.url.attached?
end
json.count user.photos.all.length()

json.followers user.followers do |follower| 
    json.id follower.id
end
json.followings user.inverse_followers.all.length()