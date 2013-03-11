class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :url
      t.string :name
      t.text :description
      t.string :company
      t.string :industry
      t.string :location
      t.string :job_type
      t.date :deadline
      t.string :website
      t.text :tags

      t.timestamps
    end
  end
end
