require 'rails_helper'

RSpec.describe "user signup", type: :feature do
  
  it "should show signup link" do
    visit root_path
    expect(page).to have_selector("a", text: "Sign up")
  end
  
  it "should signup the user" do
    visit root_path
    click_link "Sign up"
    expect(page).to have_text("New User Sign up")
    
    fill_in "First name", with: "Eric"
    fill_in "Last name", with: "Seijo"
    fill_in "Email", with: "eric@example.com"
    fill_in "Password", with: "secret"
    fill_in "Password confirmation", with: "secret"
    click_button "Sign up"
    
    expect(page).to have_text("Shopping Dashboard")
    expect(current_path).to eq user_dashboard_path
  end
  
  it "displays the user's username after successful login" do
    user = FactoryGirl.create(:user, :email => "eric@example.com", :password => "secret")
    visit new_user_session_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"
  
    expect(page).to have_text("Eric's Shopping Dashboard")
  end
  
end
