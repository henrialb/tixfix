class AddVenuesToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :venues, null: false, foreign_key: true
  end
end
