FactoryGirl.define do
  factory :product do
    name "Kale"
    estimated_cost "9.99"
    association :user
  end
end
