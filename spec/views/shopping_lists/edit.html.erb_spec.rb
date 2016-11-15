require 'rails_helper'

RSpec.describe "shopping_lists/edit", type: :view do
  before(:each) do
    user = FactoryGirl.create(:user)
    @shopping_list = assign(:shopping_list, user.shopping_lists.create!(
      :name => "My Store"
    ))
  end

  it "renders the edit shopping_list form" do
    render

    assert_select "form[action=?][method=?]", shopping_list_path(@shopping_list), "post" do

      assert_select "input#shopping_list_name[name=?]", "shopping_list[name]"
    end
  end
end
