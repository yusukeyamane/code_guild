class Contract < ActiveRecord::Base
  has_many :chats
  belongs_to :contractable, polymorphic: true
  belongs_to :user
end
