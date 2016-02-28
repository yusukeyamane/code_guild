class RenameNameColumnToLectures < ActiveRecord::Migration
  def change
    rename_column :lectures, :name, :title
  end
end
