class Question < ActiveRecord::Base
  has_one :contract, as: :contractable
  has_many :skill_relations, as: :skill_relationable
  belongs_to :user

  validates_presence_of :title, :content, :reward
end
