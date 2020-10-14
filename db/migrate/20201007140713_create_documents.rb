class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.integer :documentable_id
      t.string  :reactionable_type
      t.boolean :type

      t.timestamps
    end
  end
end
