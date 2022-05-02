class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.string :name, null: false, default: ''
      t.belongs_to :campaign, foreign_key: true, null: false

      t.timestamps
    end
  end
end
