class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :reporter_survivor_id
      t.references :survivor, foreign_key: true

      t.timestamps
    end
  end
end
