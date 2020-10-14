class CreateNormalizationFactors < ActiveRecord::Migration[6.0]
  def change
    create_table :normalization_factors do |t|
      t.string  :code,               limit: 10
      t.decimal :coef,               precision: 5, scale: 2
      t.string  :name,               limit: 50
      t.text    :description,        limit: 1000

      t.timestamps
    end
  end
end
