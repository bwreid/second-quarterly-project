class AddRelationshipsToTanksAndJobsTables < ActiveRecord::Migration
  def change
    add_column :jobs, :tank_id, :integer
    add_column :tanks, :user_id, :integer
  end
end
