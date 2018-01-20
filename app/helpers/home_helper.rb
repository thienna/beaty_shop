module HomeHelper
  def products_sort_types
    Settings.product.sort_types.map do |key, value|
      [t("home_page.sort.#{key}"), value]
    end
  end
end
