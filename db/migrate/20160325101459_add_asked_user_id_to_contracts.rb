class AddAskedUserIdToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :asked_user_id, :integer
  end
end
