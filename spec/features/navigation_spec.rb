require 'rails_helper'

RSpec.describe "Navigation", type: :feature do
  
  let(:user) {FactoryGirl.create(:user)}
  
  context "homepage" do
    
    it "should allow user to login if logged out" do
      visit root_path
      expect(page).to have_text "Sign in"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"
      expect(current_path).to eq user_dashboard_path
      expect(page).to have_text("Shopping Dashboard")
    end  
    
    it "should show sign out link if signed in" do
      sign_in user
      expect(page).to have_text("Sign out")
    end
    
    it "should link user to product dashboard if logged in" do
      sign_in user
      visit root_path
      expect(page).to have_link('Dashboard')
    end  
    
  end
  
  
  context "user dashboard" do
    
    it "should show logout links" do
      sign_in user
      visit products_path
      expect(page).to have_text("Sign out")
    end
    
    it "should allow user to logout" do
      sign_in user
      visit products_path
      expect(page).to have_text("Sign out")
      click_link "Sign out"
      expect(current_path).to eq(root_path)
      expect(page).to have_text("Sign in")
    end 
    
    it "should link to user's account page" do
      sign_in user
      visit products_path
      expect(page).to have_link("Account")
      skip "Need to implement"
      click_link "Account"
      expect(current_path).to eq('users_account_path')
    end
    
     
  end
  
  
end
