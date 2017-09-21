class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :price_cents,    default: 0,     null: false
      t.string :price_currency, default: "USD", null: false
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
