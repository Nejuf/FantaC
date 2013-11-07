require 'spec_helper'

describe "contest_positions/show" do
  before(:each) do
    @contest_position = assign(:contest_position, stub_model(ContestPosition))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
