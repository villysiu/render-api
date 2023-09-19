json.array! @photos do |photo|
    
    json.id photo.id
    json.url Rails.application.routes.url_helpers.rails_blob_path(photo.url, only_path: true) if photo.url.attached?
    json.cid photo.comment_id

    if photo.comment_id.present?
        json.desc do
            json.partial! 'comments/comment', comment: Comment.find(photo.comment_id) 
        end
    end
    json.owner do 
        json.partial! 'users/user/user', user: photo.user
    end
    json.created_at photo.created_at.to_i

    json.comments photo.comments.where.not(id: photo.comment_id) do |comment|
        json.partial! 'comments/comment', comment: comment
    end
        
end
