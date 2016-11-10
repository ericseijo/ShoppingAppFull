require 'rails_helper'

RSpec.describe "when in the dashboard", type: :feature do
  
  let(:user) {FactoryGirl.create(:user)}
  
  before do
    sign_in user
    visit user_dashboard_path
  end
  
  it "should link product items" do
    expect(page).to have_link('Products')
    click_link('Products')
    expect(current_path).to eq products_path
  end
  
  it "should link to lists" do
    expect(page).to have_link('Shopping Lists')
  end
  
  it "should list the last 5 product items" do
    skip
  end
  
  it "should show the last 3 lists" do
    skip
  end
  
  it "should link to start a shopping trip" do
    skip
  end
  
  it "should show user's you've shared with" do
    skip
  end
  
end
