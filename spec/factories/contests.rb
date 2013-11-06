# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contest do
    name "MyString"
    desc "MyText"
    points_cap 1
    entry_fee 1
    payout_type_id 1
    payout_amount 1
    user_id 1
    battle_result_id 1
  end
end
