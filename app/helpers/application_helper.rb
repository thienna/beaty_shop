module ApplicationHelper
  def full_title page_title = ""
    base_title = t "home_page.title"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def current_cart
    session[:cart] ||= Array.new
  end

  def current_cart_total_price
    return Settings.price.default if current_cart.empty?
    current_cart.map do |item|
      item["unit_price"]
    end.sum
  end
end
