class CreateCompetitions < ActiveRecord::Migration[7.1]
  def change
    create_table :competitions do |t|
      t.string :name
      t.string :sport
      t.date :start_date
      t.date :end_date
      t.string :venue
      t.string :manager

      t.timestamps
    end
  end
end
