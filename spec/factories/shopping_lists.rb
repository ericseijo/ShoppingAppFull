FactoryGirl.define do
  factory :shopping_list do
    name "Whole Foods"
    association :user
  end
end
