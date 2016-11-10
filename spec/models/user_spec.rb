require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.build(:user)
  end
  
  it { should respond_to :email }
  it { should respond_to :first_name }
  it { should respond_to :last_name }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  
  it { should have_many :products }
  
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  
  it "should not save without an email" do
    expect(FactoryGirl.build(:user, email: nil)).to be_invalid
    expect(FactoryGirl.build(:user)).to be_valid
  end
  
  it "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                            foo@bar+baz.com]

    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).to be_invalid
    end
  end

  it "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com user@foo.org user.name@example.com 
                            foo@bar-baz.com]
                            
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
    end
    
  end
  
  it "should return a full name" do
    expect(@user.full_name).to eq('Eric Seijo')
  end
  
  
  
end
