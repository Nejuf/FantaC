require 'spec_helper'

describe "BattleRosters" do
  describe "GET /battle_rosters" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get battle_rosters_path
      response.status.should be(200)
    end
  end
end
