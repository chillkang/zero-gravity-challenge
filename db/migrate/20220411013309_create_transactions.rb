class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :purpose
      t.float :amount
      t.string :status

      t.timestamps
    end
  end
end
