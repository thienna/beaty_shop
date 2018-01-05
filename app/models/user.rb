class User < ApplicationRecord
  has_many :orders, dependent: :destroy

  devise :rememberable, :validatable, :database_authenticatable
end
