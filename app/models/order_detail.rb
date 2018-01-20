class OrderDetail < ApplicationRecord
  ATTRIBUTES = %i(order_id product_id quantity unit_price).freeze

  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true,
    numericality:
      {only_integer: true, greater_than: Settings.product.quantity.minimum}

  before_save :calculate_unit_price

  private

  def calculate_unit_price
    self.unit_price = quantity * product.price
  end
end
