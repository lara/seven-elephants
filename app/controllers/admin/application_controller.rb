module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin
    http_basic_authenticate_with name: "admin", password: ENV.fetch("HTTP_AUTHENTICATION_PASSWORD")

    def authenticate_admin; end

    def records_per_page
      params[:per_page] || 100
    end
  end
end
