class FixQrCodeName < ActiveRecord::Migration[6.1]
  def change
    rename_column :tickets, :qr_code, :hex
  end
end
