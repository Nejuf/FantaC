require 'spec_helper'

describe "contests/index" do
  before(:each) do
    assign(:contests, [
      stub_model(Contest),
      stub_model(Contest)
    ])
  end

  it "renders a list of contests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
