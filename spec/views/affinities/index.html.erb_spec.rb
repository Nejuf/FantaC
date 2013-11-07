require 'spec_helper'

describe "affinities/index" do
  before(:each) do
    assign(:affinities, [
      stub_model(Affinity),
      stub_model(Affinity)
    ])
  end

  it "renders a list of affinities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
