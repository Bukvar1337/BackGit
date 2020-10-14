class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.integer :reactionable_id
      t.string  :reactionable_type
      t.boolean :type

      t.timestamps
    end
  end
end
