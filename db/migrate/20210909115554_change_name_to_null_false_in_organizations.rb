class ChangeNameToNullFalseInOrganizations < ActiveRecord::Migration[6.1]
  def change
    change_column_null :organizations, :name, false
  end
end
