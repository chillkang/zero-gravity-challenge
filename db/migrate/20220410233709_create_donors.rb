class CreateDonors < ActiveRecord::Migration[6.1]
  def change
    create_table :donors do |t|
      t.string :company_name
      t.string :bank_name
      t.integer :bank_account

      t.timestamps
    end
  end
end
