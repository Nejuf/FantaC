# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :character do
    name { Faker::Name.name }
    desc { "This character is shrouded in mystery...\nWhat potential lies in store?" }
    user_id { 1 }
    affinity_id { [1,2,3].sample }
    tier_id { [1,2,3,4].sample }
    series_id { nil }
    stat_hp { (100*rand).floor }
    stat_str { (100*rand).floor }
    stat_def { (100*rand).floor }
    stat_spd { (100*rand).floor }
    stat_int { (100*rand).floor }
    stat_luck { (100*rand).floor }
  end
end
