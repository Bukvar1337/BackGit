class CreateRisksSolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :risks_solutions, id: false do |t|
      t.integer :risk_id
      t.integer :solution_id
    end
  end
end
