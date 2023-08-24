class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

         has_one_attached :avatar
         has_many :photos, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :notifications, dependent: :destroy
end
