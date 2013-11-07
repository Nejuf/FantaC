require 'spec_helper'

describe "tiers/index" do
  before(:each) do
    assign(:tiers, [
      stub_model(Tier),
      stub_model(Tier)
    ])
  end

  it "renders a list of tiers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
