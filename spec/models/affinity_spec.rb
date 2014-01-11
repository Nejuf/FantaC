require 'spec_helper'

describe Affinity do

  context 'validation' do 
  	it { should validate_presence_of(:name) }
  	it { should validate_uniqueness_of(:name) }
  	it { should ensure_length_of(:name).is_at_least(1).is_at_most(40) }

  	it 'has a valid factory' do
  		expect(FactoryGirl.create(:affinity)).to be_valid
  	end

  	it 'is invalid without a name' do
  		expect(FactoryGirl.build(:affinity, name: '')).to_not be_valid
  	end

  	it 'is invalid without unique name' do
  		FactoryGirl.create(:affinity, name: 'testaffinity1234')
  		expect(FactoryGirl.build(:affinity, name: 'testaffinity1234')).to_not be_valid
  	end

  	it 'is invalid when name length is more than 40 characters' do
  		expect(FactoryGirl.build(:affinity, name: 'as'*21)).to_not be_valid
  	end

  	it 'normalizes name to downcase before saving' do
  		aff = FactoryGirl.create(:affinity, name: 'MyTestAffinity1234')
  		aff.save
  		expect(aff.name).to eq('mytestaffinity1234')
  	end

  end

  context 'associations' do
  	it { should have_many(:characters) }
  end

  context '#id_by_name' do
  	it 'finds ID by name' do 
	  	FactoryGirl.create(:affinity)
	  	aff = FactoryGirl.create(:affinity)
	  	FactoryGirl.create(:affinity)
	  	
	  	expect(Affinity.id_by_name(aff.name)).to eq(aff.id)
	  end

	  it 'finds ID by name regardless of case' do
	  	FactoryGirl.create(:affinity)
	  	aff = FactoryGirl.create(:affinity, name: 'WeirdCaseName')
	  	FactoryGirl.create(:affinity)
	  	
	  	expect(Affinity.id_by_name('wEiRdCAsenamE')).to eq(aff.id)
	  end
  end

  context '#normalize' do
  	it 'sets nil name to empty string' do
	  	aff = FactoryGirl.build(:affinity, name: nil)
	  	aff.normalize
	  	expect(aff.name).to eq('')
	  end

	  it 'downcases a name' do
	  	aff = FactoryGirl.build(:affinity, name: 'MyTestAffinity1234')
	  	aff.normalize
	  	expect(aff.name).to eq('MyTestAffinity1234'.downcase)
	  end
  end
end
