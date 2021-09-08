class RemoveNullFalseFromOrganizationIdInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :organization_id, :bigint, null: true
  end
end
