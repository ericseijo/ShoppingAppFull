require 'rails_helper'

RSpec.describe "shopping_lists/index", type: :view do
  before(:each) do
    user = FactoryGirl.create(:user)
    
    assign(:shopping_lists, [
      user.shopping_lists.create!(
        :name => "Name"
      ),
      user.products.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of lists" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
