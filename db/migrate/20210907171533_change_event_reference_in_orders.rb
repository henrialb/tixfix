class ChangeEventReferenceInOrders < ActiveRecord::Migration[6.1]
  def change
    remove_reference :orders, :events, foreign_key: true

    add_reference :orders, :event, null: false, foreign_key: true
  end
end
