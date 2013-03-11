class CreateTanks < ActiveRecord::Migration
  def change
    create_table :tanks do |t|
      t.string :name

      t.timestamps
    end
  end
end
