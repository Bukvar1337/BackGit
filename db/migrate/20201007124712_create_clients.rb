class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string  :name,               limit: 100
      t.string  :uuid,               limit: 100

      t.timestamps
    end
  end
end
