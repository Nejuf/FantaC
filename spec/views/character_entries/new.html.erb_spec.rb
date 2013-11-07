require 'spec_helper'

describe "character_entries/new" do
  before(:each) do
    assign(:character_entry, stub_model(CharacterEntry).as_new_record)
  end

  it "renders new character_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", character_entries_path, "post" do
    end
  end
end
