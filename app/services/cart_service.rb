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
    when :remove_item
      remove_item
    when :update_cart
      update_cart
    else
      wrong_cart
    end
  end

  private

  def add_item
    price = @product.get_price * @quantity
    availability =
      @product.quantity >= @quantity ? 1 : 0

    @cart << {
      "product_id" => @product.id,
      "quantity" => @quantity,
      "unit_price" => price.to_i,
      "product_name" => @product.name,
      "product_img" => @product.picture.url,
      "product_price" => @product.get_price.to_i,
      "availability" => availability
    }

    {cart: @cart, flash: :success, message: I18n.t("home_page.cart.action.add_success")}
  end

  def update_cart
    @cart.each_with_index do |item, index|
      if item["product_id"] == @product.id
        @cart[index]["quantity"] = @quantity
        break
      end
    end

    message = I18n.t "home_page.cart.action.update_succes"

    {cart: @cart, flash: :success, message: message}
  end

  def remove_item
    @cart.delete_if {|item| item["product_id"] == @product.id}

    flash = :info
    message = I18n.t "home_page.cart.action.remove_success"

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
