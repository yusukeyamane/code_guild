class RemoveCreatedAtFromSkills < ActiveRecord::Migration
  def change
    remove_column :skills, :created_at, :datetime
    remove_column :skills, :updated_at, :datetime
  end
end
