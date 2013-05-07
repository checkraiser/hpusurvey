class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.date :open_date
      t.date :close_date
      t.string :title
      t.string :year
      t.integer :semester_id
      t.boolean :activated
      t.timestamps
    end
  end
end
