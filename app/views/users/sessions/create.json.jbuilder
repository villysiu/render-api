json.curr_user do 
    json.partial! 'users/sessions/user', current_user: @current_user
end