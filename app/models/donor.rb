class Donor < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :scholars, through: :transactions

  validates :company_name, :bank_name, :bank_account, presence: true
end
