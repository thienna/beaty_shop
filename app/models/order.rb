class Order < ApplicationRecord
  enum status: %i(pending confirmed rejected done).freeze
  ATTRIBUTES =
    [:customer_name, :customer_address, :customer_email, :customer_phone,
      :status, :total_price, :admin_id,
      order_details_attributes: OrderDetail::ATTRIBUTES].freeze
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  belongs_to :user, optional: true

  has_many :order_details, dependent: :destroy

  accepts_nested_attributes_for :order_details, allow_destroy: true,
    reject_if: proc {|attributes| attributes["unit_price"].blank?}

  validates :customer_name, presence: true
  validates :customer_address, presence: true
  validates :customer_email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :customer_phone, presence: true

  scope :newest, ->{order created_at: :desc}

  before_save :calculate_total_price

  def send_order_information
    OrderMailer.order_information(self).deliver_now
  end

  private

  def calculate_total_price
    self.total_price = order_details.map do |order_detail|
      order_detail.valid? ? (order_detail.quantity * order_detail.unit_price) : 0
    end.sum
  end
end
