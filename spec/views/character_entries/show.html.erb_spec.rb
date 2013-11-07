require 'spec_helper'

describe "character_entries/show" do
  before(:each) do
    @character_entry = assign(:character_entry, stub_model(CharacterEntry))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
