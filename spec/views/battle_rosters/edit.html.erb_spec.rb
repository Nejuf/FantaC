require 'spec_helper'

describe "battle_rosters/edit" do
  before(:each) do
    @battle_roster = assign(:battle_roster, stub_model(BattleRoster))
  end

  it "renders the edit battle_roster form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", battle_roster_path(@battle_roster), "post" do
    end
  end
end
