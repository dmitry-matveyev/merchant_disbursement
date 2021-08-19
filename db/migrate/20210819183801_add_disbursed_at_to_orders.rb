class AddDisbursedAtToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :disbursed_at, :datetime
  end
end
