class CreateCriterionsRisks < ActiveRecord::Migration[6.0]
  def change
    create_table :criterions_risks, id: false do |t|
      t.integer :criterion_id
      t.integer :risk_id
    end
  end
end
