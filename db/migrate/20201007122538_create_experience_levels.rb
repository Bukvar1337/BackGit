class CreateExperienceLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :experience_levels do |t|
      t.decimal :coef,               precision: 5, scale: 2
      t.string  :name,               limit: 50
      t.string  :description,        limit: 100

      t.timestamps
    end
  end
end
