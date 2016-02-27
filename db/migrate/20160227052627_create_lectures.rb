class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :name
      t.text :content
      t.integer :avarable_time
      t.integer :charge

      t.timestamps null: false
    end
  end
end
