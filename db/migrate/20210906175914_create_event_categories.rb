class CreateEventCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :event_categories do |t|
      t.references :event, null: false, foreign_key: true
      t.integer :price, null: false
      t.integer :capacity, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
