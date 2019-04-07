class User < ApplicationRecord
  has_many :books
  has_many :reviews

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
