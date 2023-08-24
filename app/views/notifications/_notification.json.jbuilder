json.id notification.id

json.from_user do 
    json.partial! 'users/user/user', user: User.find(notification.from_user_id)
end
#json.post Photo.find(notification.post_id)
json.post do 
    json.partial! 'photos/photo', photo: Photo.find(notification.post_id)
end
json.topic notification.topic   