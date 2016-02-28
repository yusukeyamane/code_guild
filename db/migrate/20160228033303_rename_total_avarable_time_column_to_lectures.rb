class RenameTotalAvarableTimeColumnToLectures < ActiveRecord::Migration
  def change
    rename_column :lectures, :avarable_time, :total_avarable_time
  end
end
