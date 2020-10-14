class CreateProjectTermCoefs < ActiveRecord::Migration[6.0]
  def change
    create_table :project_term_coefs do |t|
      t.integer :range_from
      t.integer :range_to
      t.decimal :coef,               precision: 5, scale: 2

      t.timestamps
    end
  end
end
