# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :battle do
    name "MyString"
    desc "MyText"
    start_date "MyString"
    end_date "MyString"
    user_id 1
  end
end
