class Scholar < ApplicationRecord
  belongs_to :user
  has_many :transactions
  
  validates :institution_name, :bank_name, :bank_account, presence: true
end
