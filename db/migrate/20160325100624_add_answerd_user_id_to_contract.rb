class AddAnswerdUserIdToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :answerd_user_id, :integer
  end
end
