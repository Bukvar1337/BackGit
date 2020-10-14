class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :experience_level_id
      t.integer :department_id
      t.integer :parent_id
      t.string  :parent_uuid,        limit: 100
      t.string  :uuid,               limit: 100
      t.string  :first_name,         limit: 50
      t.string  :middle_name,        limit: 50
      t.string  :last_name,        limit: 50
      t.string  :job_position,       limit: 100

      t.timestamps
    end
  end
end
