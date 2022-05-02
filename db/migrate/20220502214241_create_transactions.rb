class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.date :date, null: false
      t.monetize :amount, null: false
      t.belongs_to :budget, foreign_key: true, null: false

      t.timestamps
    end
  end
end
