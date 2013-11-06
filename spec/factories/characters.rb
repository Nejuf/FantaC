# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :character do
    name "MyString"
    desc "MyText"
    user_id 1
    affinity 1
    tier_id 1
    stat_hp 1
    stat_str 1
    stat_def 1
    stat_spd 1
  end
end
