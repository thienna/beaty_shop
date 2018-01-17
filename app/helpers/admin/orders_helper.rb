module Admin::OrdersHelper
  def order_status_list statuses
    statuses.keys.map do |key|
      [t("admin_page.orders.form.status.#{key}"), key]
    end
  end

  def order_status_list_key statuses
    statuses.map do |key, value|
      [t("admin_page.orders.form.status.#{key}"), value]
    end
  end
end
