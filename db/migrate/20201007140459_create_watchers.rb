class CreateWatchers < ActiveRecord::Migration[6.0]
  def change
    create_table :watchers do |t|
      t.integer :risk_question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
