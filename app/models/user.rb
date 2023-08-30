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
        #  has_many :followers, dependent: :destroy

         has_many :followers_association, :class_name => "Follower", dependent: :destroy
          has_many :followers, :through => :followers_association, :source => :follower

          has_many :inverse_followers_association, :class_name => "Follower", :foreign_key => "follower_id", dependent: :destroy
          has_many :inverse_followers, :through => :inverse_followers_association, :source => :user

end