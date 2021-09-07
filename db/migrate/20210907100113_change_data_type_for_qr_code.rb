class ChangeDataTypeForQrCode < ActiveRecord::Migration[6.1]
  def change
    change_column :tickets, :qr_code, :string
  end
end
