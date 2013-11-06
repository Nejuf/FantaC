# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    name "MyString"
    desc "MyText"
    user_id 1
    contest_id 1
  end
end
