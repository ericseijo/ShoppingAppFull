FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'abc1234'
    first_name 'Eric'
    last_name 'Seijo'
    
      # after(:create) do |user|
      #   user.products << FactoryGirl.create(:product)
      # end
  end
end
