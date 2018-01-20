class Supports::ProductSupport
  def max_price
    @max ||= Product.maximum(:price).to_i
  end

  def min_price
    @min ||= Product.minimum(:price).to_i
  end

  def all_categories
    @categories ||= Category.all
  end
end
