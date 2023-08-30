json.id user.id
json.name user.name
json.avatar Rails.application.routes.url_helpers.rails_blob_path(user.avatar, only_path: true) if user.avatar.attached?
