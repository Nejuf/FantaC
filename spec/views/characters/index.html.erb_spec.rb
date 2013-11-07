require 'spec_helper'

describe "characters/index" do
  before(:each) do
    assign(:characters, [
      stub_model(Character),
      stub_model(Character)
    ])
  end

  it "renders a list of characters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
