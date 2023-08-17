json.array! @photos do |photo|

    json.id photo.id
    json.url Rails.application.routes.url_helpers.rails_blob_path(photo.url, only_path: true) if photo.url.attached?
  
    json.desc photo.comment_id
  
    json.owner do 
        json.partial! 'users/user/user', user: photo.user
    end
    json.created_at photo.created_at.to_i

    json.comments photo.comments do |comment|
        json.partial! 'comments/comment', comment: comment
    end
        
end