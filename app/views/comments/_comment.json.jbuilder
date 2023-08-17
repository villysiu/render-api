
json.id comment.id
json.user do 
    json.partial! 'users/user/user', user: comment.user
end
json.comment comment.comment   
json.created_at comment.created_at.to_i
json.likes comment.likes do |like|
   # json.partial! 'users/user/user', user: like.user
    json.user_id like.user.id
    json.user_name like.user.name
end