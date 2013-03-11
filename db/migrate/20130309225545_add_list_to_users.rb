class AddListToUsers < ActiveRecord::Migration
  def change
    add_column :users, :complete_list, :boolean, :default => true
  end
end
