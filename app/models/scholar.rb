class Scholar < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :donors, through: :transactions

  validates :institution_name, :bank_name, :bank_account, presence: true
end
