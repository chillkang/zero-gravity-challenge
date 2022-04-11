class CreateScholars < ActiveRecord::Migration[6.1]
  def change
    create_table :scholars do |t|
      t.string :institution_name
      t.string :bank_name
      t.integer :bank_account

      t.timestamps
    end
  end
end
