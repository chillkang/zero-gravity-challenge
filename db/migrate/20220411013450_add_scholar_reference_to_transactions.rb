class AddScholarReferenceToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :scholar, foreign_key: true
  end
end
