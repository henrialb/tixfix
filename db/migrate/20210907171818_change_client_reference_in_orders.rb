class ChangeClientReferenceInOrders < ActiveRecord::Migration[6.1]
  def change
    remove_reference :orders, :clients, foreign_key: true

    add_reference :orders, :client, foreign_key: true
  end
end
