class CreateContributions < ActiveRecord::Migration[7.0]
  def change
    create_table :contributions do |t|
      t.belongs_to :transaction, foreign_key: true, null: false

      t.timestamps
    end
  end
end
