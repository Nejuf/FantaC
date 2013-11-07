require 'spec_helper'

describe "affinities/show" do
  before(:each) do
    @affinity = assign(:affinity, stub_model(Affinity))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
