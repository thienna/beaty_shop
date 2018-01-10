class Category < ApplicationRecord
  ATTRIBUTES = %i(name description).freeze

  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories

  validates :name, presence: true,
    length: {maximum: Settings.categories.name.maximum}
end
