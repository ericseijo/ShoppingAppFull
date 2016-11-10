require 'rails_helper'

RSpec.describe "security", type: :feature do
  
  it "should not allow a non-logged in user to access the product dashboard" do
    visit products_path
    expect(current_path).to eq new_user_session_path
    expect(page).to have_text 'Log in'
  end
  
end
