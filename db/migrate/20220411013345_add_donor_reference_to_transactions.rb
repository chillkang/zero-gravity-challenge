class AddDonorReferenceToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :donor, foreign_key: true
  end
end
