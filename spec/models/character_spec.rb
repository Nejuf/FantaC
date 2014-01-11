require 'spec_helper'

describe Character do
	context 'validation' do 
		before(:all) do
			@stats = [
				:stat_hp,
				:stat_str,
				:stat_def,
				:stat_spd,
				:stat_int,
				:stat_luck
				]
		end

		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:affinity_id) }
		it { should validate_presence_of(:tier_id) }
		it { should validate_uniqueness_of(:name).scoped_to(:series_id) }

		it { should ensure_length_of(:name).is_at_least(1).is_at_most(80) }
		
		it 'validates presence of stats' do
			@stats.each do |stat|
				should validate_presence_of(stat)
			end
		end

		it 'validates numericality of stats' do
			@stats.each do |stat|
				should validate_numericality_of(stat).only_integer
				should validate_numericality_of(stat).is_greater_than_or_equal_to(0)
			end
		end

	  it 'has a valid factory' do
	  	expect(FactoryGirl.create(:character)).to be_valid
	  end

	  it 'is invalid without a name' do
	  	expect(FactoryGirl.build(:character, name: "")).to_not be_valid
	  end

	  it 'is invalid if name is more than 80 characters' do
	  	expect(FactoryGirl.build(:character, name: "as"*41)).to_not be_valid
	  end

	  it 'is invalid without an affinity' do
	  	expect(FactoryGirl.build(:character, affinity_id: nil)).to_not be_valid
	  end

	  it 'is invalid without a tier' do
	  	expect(FactoryGirl.build(:character, tier_id: nil)).to_not be_valid
	  end

	  it 'is invalid without stats' do
	  	expect(FactoryGirl.build(:character, stat_hp: nil)).to_not be_valid
	  	expect(FactoryGirl.build(:character, stat_str: nil)).to_not be_valid
	  	expect(FactoryGirl.build(:character, stat_def: nil)).to_not be_valid
	  	expect(FactoryGirl.build(:character, stat_spd: nil)).to_not be_valid
	  	expect(FactoryGirl.build(:character, stat_int: nil)).to_not be_valid
	  	expect(FactoryGirl.build(:character, stat_luck: nil)).to_not be_valid
	  end

	  it 'is invalid with stats than 0' do
	  	expect(FactoryGirl.build(:character, stat_str: -1)).to_not be_valid
	  end

	  it 'is invalid with non-integer stats' do
	  	expect(FactoryGirl.build(:character, stat_str: 1.5)).to_not be_valid
	  end

	  it 'is invalid when it shares a name with another character in the same series' do
	  	bob1 = FactoryGirl.create(:character, name: "Bob", series_id: 1)
	  	bob2 = FactoryGirl.build(:character, name: "Bob", series_id: 1)
	  	expect(bob2).to_not be_valid
	  end

	  it 'is valid when it shares a name with another character in a different series' do
	  	bob1 = FactoryGirl.create(:character, name: "Bob", series_id: 1)
	  	bob2 = FactoryGirl.build(:character, name: "Bob", series_id: 2)
	  	expect(bob2).to be_valid
	  end
	end

	context 'associations' do
		it { should belong_to(:user) }
		it { should belong_to(:tier) }
		it { should belong_to(:affinity) }
		it { should belong_to(:series) }
		
		it { should have_many(:battle_rosters) }
		it { should have_many(:battles).through(:battle_rosters) }
		it { should have_many(:character_entries) }
		it { should have_many(:entries).through(:character_entries) }
		it { should have_many(:portraits) }
	end
end
