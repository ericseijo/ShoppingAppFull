require 'rails_helper'

RSpec.describe "user signup and login links", type: :request do
  
  it "should show signup and login links" do
    get root_path
    expect(response).to have_http_status(200)
    expect(response.body).to include("Shopping App")
  end
  
  it "should redirect the user to signup page" do
    user = FactoryGirl.create(:user, first_name: 'John', email: "john@example.com", :password => "secret")
    get new_user_session_path
    expect(response).to render_template(:new)
    
    post "/users/sign_in", params: { user: { email: user.email, password: user.password } }
    
    expect(response).to redirect_to(user_dashboard_path)
  end
  
end
