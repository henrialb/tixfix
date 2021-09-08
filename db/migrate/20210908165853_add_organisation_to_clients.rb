class AddOrganisationToClients < ActiveRecord::Migration[6.1]
  def change
    add_reference :clients, :organisation, null: false, foreign_key: true
  end
end
