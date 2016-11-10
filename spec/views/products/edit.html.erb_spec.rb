require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    user = FactoryGirl.create(:user)
    @product = assign(:product, user.products.create!(
      :name => "MyString",
      :estimated_cost => "9.99"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_estimated_cost[name=?]", "product[estimated_cost]"
    end
  end
end
