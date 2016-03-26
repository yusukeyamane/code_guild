class AddSkillLevelToSkillRelations < ActiveRecord::Migration
  def change
    add_column :skill_relations, :skill_level, :string
  end
end
