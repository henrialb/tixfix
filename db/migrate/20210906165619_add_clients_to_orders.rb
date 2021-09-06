class AddClientsToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :clients, null: false, foreign_key: true
  end
end
