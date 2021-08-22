class AddIndexOnOrdersDisbursedAt < ActiveRecord::Migration[6.0]
  def change
    add_index :orders, :disbursed_at
  end
end
