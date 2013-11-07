require 'spec_helper'

describe "battle_rosters/index" do
  before(:each) do
    assign(:battle_rosters, [
      stub_model(BattleRoster),
      stub_model(BattleRoster)
    ])
  end

  it "renders a list of battle_rosters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
