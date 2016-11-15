require 'rails_helper'

RSpec.describe "shopping_lists/new", type: :view do
  before(:each) do
    assign(:shopping_list, ShoppingList.new(
      :name => "MyString"
    ))
  end

  it "renders new shopping_list form" do
    render

    assert_select "form[action=?][method=?]", shopping_lists_path, "post" do

      assert_select "input#shopping_list_name[name=?]", "shopping_list[name]"

    end
  end
end
