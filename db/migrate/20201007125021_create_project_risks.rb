class CreateProjectRisks < ActiveRecord::Migration[6.0]
  def change
    create_table :project_risks do |t|
      t.integer :project_id
      t.integer :risk_id
      t.integer :project_stage_id
      t.integer :risk_status_id
      t.integer :risk_probability_level_id
      t.integer :strategy_id
      t.text    :description,               limit: 1000
      t.integer :delay
      t.integer :added_by_user_id
      t.timestamps
    end
  end
end
