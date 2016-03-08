class Lecture < ActiveRecord::Base
  has_one :contract, as: :contractable
  belongs_to :user

   acts_as_taggable_on :categories
end
