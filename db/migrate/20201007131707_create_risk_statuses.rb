class CreateRiskStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :risk_statuses do |t|
      t.string  :code,               limit: 10
      t.string  :name,               limit: 50
      t.text    :description,        limit: 1000
      t.integer :position
      t.decimal :coef,               precision: 2, scale: 2

      t.timestamps
    end
  end
end
