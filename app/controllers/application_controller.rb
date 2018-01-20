class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :set_global_search_variable

  class << self
    def default_url_options
      {locale: I18n.locale}
    end
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def after_sign_in_path_for _resource_or_scope
    admin_root_path
  end

  def set_global_search_variable
    @search = Product.newest.ransack params[:q]
  end
end
