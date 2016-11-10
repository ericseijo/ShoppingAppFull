require 'rails_helper'

RSpec.describe "on the user dashboard", type: :feature do
  
  let(:user) {FactoryGirl.create(:user)}
  
  context "when managing groceries" do
    
    it "should show a list of users groceries" do
      skip
    end
    
    it "should not show another user's groceries" do
      skip
    end
    
    it "should allow a user to create new groceries" do
      skip
    end
    
    it "should let a user edit a grocery item" do
      skip
    end
    
    it "should let a user delete a grocery item" do
      skip
    end
    
    it "should not let a user delete a grocery item that they don't own" do
        #make sure model and cotroller enforce this
        skip
    end
    
  end
  
  
  
end
