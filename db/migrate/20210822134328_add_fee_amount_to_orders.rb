class AddFeeAmountToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :fee_amount, :decimal, default: 0
  end
end
