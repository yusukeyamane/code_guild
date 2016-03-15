class RenameClumun < ActiveRecord::Migration
  def change
    rename_column :users, :thumbnail, :avatar
  end
end
