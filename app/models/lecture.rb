class Lecture < ActiveRecord::Base
  has_one :contract, as: :contractable
  belongs_to :user

  validates_presence_of :title, :content, :charge
end
