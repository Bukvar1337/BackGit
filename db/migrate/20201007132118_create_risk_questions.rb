class CreateRiskQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :risk_questions do |t|
      t.integer :risk_id
      t.string  :topic,               limit: 100
      t.text    :text,                limit: 4000
      t.integer :user_id
      t.integer :risk_question_status_id

      t.timestamps
    end
  end
end
