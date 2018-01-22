class Product < ApplicationRecord
  ATTRIBUTES = [:name, :description, :quantity, :price,
    :price_sale, :picture, category_ids: []].freeze

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_many :order_details, dependent: :destroy

  mount_uploader :picture, PictureUploader

  validates :name, presence: true,
    length: {maximum: Settings.product.name.maximum}
  validates :quantity, presence: true,
    numericality:
      {only_integer: true, greater_than: Settings.product.quantity.minimum}
  validates :price, presence: true, numericality: true
  validates :price_sale, numericality: true, allow_nil: true
  validates :picture, presence: true
  validates :description, presence: true
  validates :categories, presence: true
  validate :picture_size

  scope :newest, ->{order created_at: :desc}

  def get_status
    return :new if created_at >= 7.days.ago
    return :sale if price_sale > 0
    quantity > 0 ? :instock : :outstock
  end

  def get_price
    price * (100 - price_sale) / 100
  end

  private

  def picture_size
    return unless picture.size > Settings.product.picture.size.megabytes
    errors.add :picture, I18n.t("admin_page.products.validates_size_failed")
  end
end
