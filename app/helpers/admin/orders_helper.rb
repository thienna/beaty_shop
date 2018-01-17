module Admin::OrdersHelper
  def order_status_list statuses
    statuses.keys.map do |key|
      [t("form.option." + key), key]
    end
  end
end
