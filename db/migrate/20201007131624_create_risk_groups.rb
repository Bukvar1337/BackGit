class CreateRiskGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :risk_groups do |t|
      t.string  :name,               limit: 50
      t.integer :position

      t.timestamps
    end
  end
end
