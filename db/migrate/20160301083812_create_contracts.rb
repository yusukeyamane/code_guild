class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :contractable_id
      t.string :contractable_type
      t.integer :host_user_id
      t.integer :guest_user_id

      t.timestamps null: false
    end
  end
end
