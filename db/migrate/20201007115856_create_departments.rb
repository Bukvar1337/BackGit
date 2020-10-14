class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.integer :parent_id
      t.string  :parent_uuid,        limit: 100
      t.string  :name,               limit: 100
      t.string  :uuid,               limit: 100

      t.timestamps
    end
  end
end
