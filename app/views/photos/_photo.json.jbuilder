json.id photo.id
json.desc do
    json.partial! 'comments/comment', comment: photo.comments.find(photo.comment_id)
end
