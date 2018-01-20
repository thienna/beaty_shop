class CartService
  def initialize args
    @cart = args[:cart]
    @product = args[:product]
    @quantity = args[:qty]
    @type = args[:type]
  end

  def perform
    case @type
    when :add_cart
      add_item
    when :exist_cart
      cart_exist
    else
      wrong_cart
    end
  end

  private

  def add_item
    price = @product.get_price * @quantity
    @cart << {
      "product_id" => @product.id,
      "quantity" => @quantity,
      "unit_price" => price.to_i
    }

    flash = :success
    message = I18n.t "home_page.cart.action.add_success"

    {cart: @cart, flash: flash, message: message}
  end

  def cart_exist
    flash = :warning
    message = I18n.t "home_page.cart.action.add_already"

    {cart: @cart, flash: flash, message: message}
  end

  def wrong_cart
    flash = :danger
    message = I18n.t "w_something_wrong"

    {cart: @cart, flash: flash, message: message}
  end
end
