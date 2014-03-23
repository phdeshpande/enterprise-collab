# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :generic_list do
    name "MyString"
    description "MyText"
    type ""
    account_id 1
  end
end
