class CreateRiskProbabilityLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :risk_probability_levels do |t|
      t.integer :probability
      t.string  :name,               limit: 50

      t.timestamps
    end
  end
end
