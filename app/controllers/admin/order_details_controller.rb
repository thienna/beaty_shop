class Admin::OrderDetailsController < Admin::BaseController
  attr_reader :order_detail

  before_action :find_order_detail, only: %i(update destroy)
  before_action :check_order_status, only: %i(update destroy)

  def update
    if order_detail.update_attributes order_detail_params
      flash[:success] = t "admin_page.orders.action.update.success"
    else
      flash[:warning] = t "admin_page.orders.action.update.failed"
    end
    redirect_back fallback_location: admin_orders_path
  end

  def destroy
    if order_detail.destroy
      flash[:success] = t "admin_page.orders.action.destroy.success"
    else
      flash[:warning] = t "admin_page.orders.action.destroy.failed"
    end
    redirect_back fallback_location: admin_orders_path
  end

  private

  def order_detail_params
    params.require(:order_detail).permit OrderDetail::ATTRIBUTES
  end

  def find_order_detail
    return if (@order_detail = OrderDetail.find_by id: params[:id])
    flash[:danger] = t "admin_page.orders.find_failed"
    redirect_to :back
  end

  def check_order_status
    return if order_detail.order.pending?
    flash[:warning] = t "admin_page.orders.action.status_not_accept"
    redirect_back fallback_location: admin_orders_path
  end
end
