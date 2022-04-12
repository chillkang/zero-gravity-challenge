class Transaction < ApplicationRecord
  belongs_to :donor, optional: true
  belongs_to :scholar, optional: true

  validates :purpose, :amount, presence: true
end
