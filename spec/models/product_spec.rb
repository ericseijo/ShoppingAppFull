require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should respond_to :name }
  it { should respond_to :estimated_cost }
  it { should validate_presence_of :name }
  it { should belong_to :user }
  
  it "has a valid factory" do
    expect(FactoryGirl.create(:product)).to be_valid
  end
  
  it "should not save without a name" do
    expect(FactoryGirl.build(:product, name: nil)).to be_invalid
    expect(FactoryGirl.build(:product)).to be_valid
  end
  
end
