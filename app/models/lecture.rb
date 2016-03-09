class Lecture < ActiveRecord::Base
  has_one :contract, as: :contractable
  belongs_to :user

  acts_as_taggable_on :categories
  validates_presence_of :title, :content, :charge
end
