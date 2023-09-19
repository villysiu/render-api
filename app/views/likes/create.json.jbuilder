json.user do 
    json.partial! 'users/user/user', user: @current_user
end