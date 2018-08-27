class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :total_price

      t.timestamps
      t.belongs_to :user, index: true
    end
  end
end
