class Transaction < ApplicationRecord
  belongs_to :donor
  belongs_to :scholar

  validates :purpose, :amount
end
