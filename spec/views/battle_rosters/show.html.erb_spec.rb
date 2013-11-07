require 'spec_helper'

describe "battle_rosters/show" do
  before(:each) do
    @battle_roster = assign(:battle_roster, stub_model(BattleRoster))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
