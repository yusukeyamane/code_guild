class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.datetime :timelimit
      t.integer :reward
      t.timestamps
    end
  end
end
