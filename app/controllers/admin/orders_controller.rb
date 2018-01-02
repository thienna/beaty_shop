class Admin::OrdersController < Admin::BaseController
  before_action :load_statuses, only: %i(new edit)

  def index; end

  def edit; end

  private

  def load_statuses
    @statuses ||= Order.statuses
  end
end
