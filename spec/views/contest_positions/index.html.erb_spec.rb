require 'spec_helper'

describe "contest_positions/index" do
  before(:each) do
    assign(:contest_positions, [
      stub_model(ContestPosition),
      stub_model(ContestPosition)
    ])
  end

  it "renders a list of contest_positions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
