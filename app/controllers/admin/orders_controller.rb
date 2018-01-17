class Admin::OrdersController < Admin::BaseController
  attr_reader :order

  before_action :load_statuses, only: %i(index update)
  before_action :find_order, only: %i(show update destroy)

  def index
    @orders = Order.page params[:page]
  end

  def show
    @order_details = order.order_details.page params[:page]
  end

  def update
    if order.update_attributes order_params
      response_update :success, :success
    else
      response_update :warning, :failed
    end
  end

  def destroy
    if order.destroy
      flash[:success] = t "admin_page.orders.action.destroy.success"
    else
      flash[:warning] = t "admin_page.orders.action.destroy.failed"
    end
    redirect_to admin_orders_path
  end

  private

  def order_params
    params.require(:order).permit Order::ATTRIBUTES
  end

  def find_order
    return if (@order = Order.find_by id: params[:id])
    flash[:danger] = t "admin_page.orders.find_failed"
    redirect_to admin_orders_path
  end

  def load_statuses
    @statuses ||= Order.statuses
  end

  def response_update flash_type, status
    message = t "admin_page.orders.action.update.#{status}"
    respond_to do |format|
      response_update_html format, flash_type, message
      format.js{flash.now[flash_type] = message}
    end
  end

  def response_update_html format, flash_type, message
    format.html do
      flash[flash_type] = message
      redirect_to admin_orders_path
    end
  end
end
