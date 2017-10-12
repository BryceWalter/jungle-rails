class Admin::AdminApplicationController < ApplicationController
  before_filter :authenticated?

  def authenticated?
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == ENV['admin_name'] && password == ENV['admin_pass']
    end
  end
end