class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :name, null: false, default: ''
      t.belongs_to :created_by, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
