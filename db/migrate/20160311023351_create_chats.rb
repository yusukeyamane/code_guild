class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :user_id
      t.integer :contract_id
      t.string :message

      t.timestamps null: false
    end
  end
end
