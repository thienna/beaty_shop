class Order < ApplicationRecord
  enum status: %i(pending confirmed rejected done).freeze

  belongs_to :user

  has_many :order_details, dependent: :destroy
end
