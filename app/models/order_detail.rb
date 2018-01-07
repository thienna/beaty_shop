class OrderDetail < ApplicationRecord
  ATTRIBUTES = %i(order_id product_id quantity unit_price).freeze

  belongs_to :order
  belongs_to :product

  before_save :calculate_unit_price

  private

  def calculate_unit_price
    self.unit_price = quantity * product.price
  end
end
