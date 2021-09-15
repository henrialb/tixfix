class ChangeVenueReferenceInEvents < ActiveRecord::Migration[6.1]
  def change
    remove_reference :events, :venues, foreign_key: true

    add_reference :events, :venue, null: false, foreign_key: true
  end
end
