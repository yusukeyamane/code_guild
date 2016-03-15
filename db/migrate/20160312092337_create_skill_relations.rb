class CreateSkillRelations < ActiveRecord::Migration
  def change
    create_table :skill_relations do |t|
      t.integer :skill_id
      t.integer :skill_relationable_id
      t.string :skill_relationable_type
      t.timestamps null: false
    end
  end
end
