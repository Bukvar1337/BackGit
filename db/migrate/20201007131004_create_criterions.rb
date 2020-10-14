class CreateCriterions < ActiveRecord::Migration[6.0]
  def change
    create_table :criterions do |t|
      t.string  :name,               limit: 100

      t.timestamps
    end
  end
end
