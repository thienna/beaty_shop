class OrderDetailsController < ApplicationController
  attr_reader :cart_detail, :detail_product, :detail_qty, :service

  before_action :load_cart_detail
  before_action :check_valid_product, :check_valid_qty, :load_service

  def create
    status = service.perform

    respond_to do |format|
      response_html format, status
      format.js{flash.now[status[:flash]] = status[:message]}
    end
  end

  private

  def load_cart_detail
    @cart_detail = params[:cart_detail]
    return if cart_detail
    flash[:danger] = t "w_something_wrong"
    redirect_to root_path
  end

  def check_valid_product
    @detail_product = Product.find_by id: cart_detail["product_id"]
    return if detail_product
    flash[:warning] = t "admin_page.products.find_failed"
    redirect_to root_path
  end

  def check_valid_qty
    @detail_qty = cart_detail["qty"].to_i
    return if detail_qty >= 1
    flash[:warning] = t "home_page.cart.action.check_qty"
    redirect_back fallback_location: root_path
  end

  def load_service
    service_type = type_filter

    if service_type == :add_cart
      current_cart.each do |item|
        if item["product_id"] == detail_product.id
          service_type = :exist_cart
          break
        end
      end
    end

    @service = CartService.new cart: current_cart,
      product: detail_product, qty: detail_qty, type: service_type
  end

  def type_filter
    case cart_detail["service"]
    when "add"
      :add_cart
    else
      :wrong_cart
    end
  end

  def response_html format, status
    format.html do
      flash[status[:flash]] = status[:message]
      redirect_back fallback_location: root_path
    end
  end
end
