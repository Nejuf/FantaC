require 'spec_helper'

describe "tiers/show" do
  before(:each) do
    @tier = assign(:tier, stub_model(Tier))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
