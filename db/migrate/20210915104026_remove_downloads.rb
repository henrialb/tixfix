class RemoveDownloads < ActiveRecord::Migration[6.1]
  def change
    drop_table :downloads
  end
end
