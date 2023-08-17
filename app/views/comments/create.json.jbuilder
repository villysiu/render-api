json.id @comment.id
json.user do 
    json.partial! 'users/user/user', user: @current_user
end
json.comment @comment.comment   
json.created_at @comment.created_at.to_i
json.likes []


