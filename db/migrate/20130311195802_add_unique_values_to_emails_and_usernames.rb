class AddUniqueValuesToEmailsAndUsernames < ActiveRecord::Migration
  def change
    add_index :users, [:email, :username], :unique => true
  end
end
