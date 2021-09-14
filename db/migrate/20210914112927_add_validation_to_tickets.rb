class AddValidationToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :is_validation, :boolean, default: false
  end
end
