require 'spec_helper'

describe "battle_rosters/new" do
  before(:each) do
    assign(:battle_roster, stub_model(BattleRoster).as_new_record)
  end

  it "renders new battle_roster form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", battle_rosters_path, "post" do
    end
  end
end
