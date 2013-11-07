require 'spec_helper'

describe "character_entries/index" do
  before(:each) do
    assign(:character_entries, [
      stub_model(CharacterEntry),
      stub_model(CharacterEntry)
    ])
  end

  it "renders a list of character_entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
