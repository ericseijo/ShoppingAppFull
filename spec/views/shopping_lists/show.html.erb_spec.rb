require 'rails_helper'

RSpec.describe "shopping_lists/show", type: :view do
  before(:each) do
    user = FactoryGirl.create(:user)
    
    @shopping_list = assign(:product, user.shopping_lists.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
