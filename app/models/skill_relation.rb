class SkillRelation < ActiveRecord::Base
  belongs_to :skill
  belongs_to :skill_relationable, polymorphic: true
end
