class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.integer :total_avarable_time
      t.integer :charge
      t.timestamps
    end
  end
end
