class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :donors, dependent: :destroy
  has_many :scholars, dependent: :destroy

  validates :first_name, :last_name, :location, presence: true
  validates :role, presence: true, inclusion: { in: %w[Donor Scholar] }
end
