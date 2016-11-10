require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    user = FactoryGirl.create(:user)
    
    @product = assign(:product, user.products.create!(
      :name => "Name",
      :estimated_cost => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
  end
end
