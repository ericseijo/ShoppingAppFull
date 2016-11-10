require 'rails_helper'

RSpec.describe "Products", type: :request do
  let(:user) {FactoryGirl.create(:user)}
  
  before do
    post new_user_session_path, :email => user.email, :password => user.password
  end
  
  describe "GET /products" do
    
  end
end
