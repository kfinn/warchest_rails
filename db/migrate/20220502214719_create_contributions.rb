class CreateContributions < ActiveRecord::Migration[7.0]
  def change
    create_table :contributions do |t|
      t.belongs_to :entry, foreign_key: true, null: false

      t.timestamps
    end
  end
end
