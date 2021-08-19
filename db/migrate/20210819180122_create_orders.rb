class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :merchant, index: true
      t.belongs_to :shopper, index: true
      t.decimal :amount
      t.datetime :completed_at

      t.timestamps
    end
  end
end
