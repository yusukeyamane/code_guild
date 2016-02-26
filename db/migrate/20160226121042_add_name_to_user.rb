class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :introduce, :text
    add_column :users, :thumbnail, :text
  end
end
