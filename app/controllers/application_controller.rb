# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_user
  # attr_accessor :current_user

  def current_user
    @current_user ||= User.first || User.create!(first_name: 'default', last_name: 'default')
  end

  helper_method :current_user
end
