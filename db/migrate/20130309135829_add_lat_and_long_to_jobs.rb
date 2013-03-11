class AddLatAndLongToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :lat, :float
    add_column :jobs, :lon, :float
  end
end
