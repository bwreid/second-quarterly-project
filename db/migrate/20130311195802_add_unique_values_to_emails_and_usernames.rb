class AddUniqueValuesToEmailsAndUsernames < ActiveRecord::Migration
  def change
    remove_column :users, :username
    remove_column :users, :email
    add_column :users, :username, :string, :unique => true
    add_column :users, :email, :string, :unique => true
  end
end
