class CreateRiskQuestionStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :risk_question_statuses do |t|
      t.string    :name,                limit: 30
      t.string    :code,                limit: 10
      t.integer   :position

      t.timestamps
    end
  end
end
