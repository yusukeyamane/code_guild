class AddSituationToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :situation, :string
  end
end
