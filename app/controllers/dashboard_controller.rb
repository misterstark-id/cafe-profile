class DashboardController < ApplicationController
  layout 'dashboard'
  def index
    @user = User.all
  end
end
