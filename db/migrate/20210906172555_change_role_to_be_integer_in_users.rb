class ChangeRoleToBeIntegerInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :role, :integer, using: 'role::integer', default: 0, null: false
  end
end
