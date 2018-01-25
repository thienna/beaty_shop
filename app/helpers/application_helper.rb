module ApplicationHelper
  def full_title page_title = ""
    base_title = t "home_page.title"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def current_cart
    session[:cart] ||= Array.new
  end
end
