class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.references :event_category, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.text :qr_code
      t.boolean :is_used, default: false

      t.timestamps
    end
  end
end
