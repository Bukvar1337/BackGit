class CreateStrategies < ActiveRecord::Migration[6.0]
  def change
    create_table :strategies do |t|
      t.string  :code,               limit: 10
      t.string  :name,               limit: 50
      t.text    :description,        limit: 1000
      t.integer :position

      t.timestamps
    end
  end
end
