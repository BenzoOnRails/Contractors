class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :company
      t.date :start_date
      t.date :end_date
      t.integer :contractor_ID

      t.timestamps
    end
  end
end
