class CreateRiskAnswerComments < ActiveRecord::Migration[6.0]
  def change
    create_table :risk_answer_comments do |t|
      t.integer :risk_answer_id
      t.integer :user_id
      t.text    :text,                limit: 4000

      t.timestamps
    end
  end
end
