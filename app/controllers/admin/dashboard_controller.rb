class Admin::DashboardController < ApplicationController
  before_filter
  http_basic_authenticate_with name: ENV['admin_name'], password: ENV['admin_pass']

  def show
  end

end
