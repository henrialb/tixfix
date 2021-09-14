class AddIsValidationToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_validation, :boolean, default: false
    remove_column :tickets, :validation
  end
end
