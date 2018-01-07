class Product < ApplicationRecord
  ATTRIBUTES = %i(name description quantity price price_sale picture).freeze

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_many :order_details, dependent: :destroy

  mount_uploader :picture, PictureUploader

  validates :name, presence: true,
    length: {maximum: Settings.product.name.maximum}
  # validates :quantity, presence: true, numericality: {only_integer: true}
  # validates :price, presence: true, numericality: true
  # validates :price_sale, numericality: true, allow_nil: true
  # validates :picture, presence: true
  # validates :description, presence: true
  # validates :categories, presence: true
  # validate :picture_size

  accepts_nested_attributes_for :product_categories

  scope :newest, ->{order created_at: :desc}

  private

  def picture_size
    return unless picture.size > Settings.product.picture.size.megabytes
    errors.add :picture, I18n.t("admin_page.products.validates_size_failed")
  end
end
