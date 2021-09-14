class CreateDownloads < ActiveRecord::Migration[6.1]
  def change
    create_table :downloads do |t|
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
