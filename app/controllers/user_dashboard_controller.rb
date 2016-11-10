class UserDashboardController < ApplicationController
  before_action :authenticate_user!
  
  layout 'dashboard'
  
  def index
    #@groceries = Grocery.all
    @products = current_user.products
  end
end
