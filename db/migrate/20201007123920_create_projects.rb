class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.integer :client_id
      t.string  :name,               limit: 100
      t.text    :description,        limit: 1000
      t.integer :manager_id
      t.integer :avg_team_cost
      t.integer :term
      t.integer :project_stage_id
      t.integer :project_status_id

      t.timestamps
    end
  end
end
