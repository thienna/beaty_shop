module Admin::ProductsHelper
  def categories_list categories
    categories.map do |category|
      [category.name, category.id]
    end
  end
end
