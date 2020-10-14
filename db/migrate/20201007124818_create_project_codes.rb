class CreateProjectCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :project_codes do |t|
      t.string  :uuid,               limit: 100
      t.string  :code,               limit: 50
      t.string  :name,               limit: 50
      t.string  :user_uuid,          limit: 100
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
