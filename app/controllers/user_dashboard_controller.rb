class UserDashboardController < ApplicationController
  before_action :authenticate_user!
  
  layout 'dashboard'
  
  def index
    @products = current_user.products
    @shopping_lists = current_user.shopping_lists
  end
end
