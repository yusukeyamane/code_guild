class Lecture < ActiveRecord::Base
  has_one :contract, as: :contractable
  belongs_to :user
  has_many :skill_relations, as: :skill_relationable
  accepts_nested_attributes_for :skill_relations

  validates_presence_of :title, :content, :charge
end
