class ChangeIntegerLimitInClient < ActiveRecord::Migration[6.0]
  def change
    change_column :client, :cp_number, :bigint
  end
end
