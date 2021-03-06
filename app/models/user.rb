class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lectures
  has_many :questions
  has_many :contracts, foreign_key: :host_user_id
  has_many :contracts, foreign_key: :guest_user_id
  has_many :reviews
  has_many :chats
  has_many :skill_relations, as: :skill_relationable
  mount_uploader :avatar, AvatarUploader

end
