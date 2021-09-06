class AddEventsToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :events, null: false, foreign_key: true
  end
end
