# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	sequence(:aff_name) do |n|
		"MyAffinity#{n}"
	end

  factory :affinity do
    name { generate(:aff_name) }
  end
end
