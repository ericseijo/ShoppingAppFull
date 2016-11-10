require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    user = FactoryGirl.create(:user)
    
    assign(:products, [
      user.products.create!(
        :name => "Name",
        :estimated_cost => "9.99"
      ),
      user.products.create!(
        :name => "Name",
        :estimated_cost => "9.99"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
