require 'spec_helper'

describe "character_entries/edit" do
  before(:each) do
    @character_entry = assign(:character_entry, stub_model(CharacterEntry))
  end

  it "renders the edit character_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", character_entry_path(@character_entry), "post" do
    end
  end
end
