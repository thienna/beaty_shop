class Order < ApplicationRecord
  enum status: %i(pending confirmed rejected done).freeze
  ATTRIBUTES = %i(customer_name customer_address customer_email
    customer_phone status total_price admin_id).freeze
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  belongs_to :user, optional: true

  has_many :order_details, dependent: :destroy

  validates :customer_name, presence: true
  validates :customer_address, presence: true
  validates :customer_email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :customer_phone, presence: true
end
