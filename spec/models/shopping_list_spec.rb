require 'rails_helper'

RSpec.describe ShoppingList, type: :model do
  it { should respond_to :name }
  it { should validate_presence_of :name }
  it { should belong_to :user }
  
  it "has a valid factory" do
    expect(FactoryGirl.create(:shopping_list)).to be_valid
  end
  
  it "should not save without a name" do
    expect(FactoryGirl.build(:shopping_list, name: nil)).to be_invalid
    expect(FactoryGirl.build(:shopping_list)).to be_valid
  end
end
