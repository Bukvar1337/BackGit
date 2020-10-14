class CreateRisks < ActiveRecord::Migration[6.0]
  def change
    create_table :risks do |t|
      t.integer :risk_group_id
      t.string  :name,               limit: 100
      t.text    :description,        limit: 1000
      t.integer :position

      t.timestamps
    end
  end
end
