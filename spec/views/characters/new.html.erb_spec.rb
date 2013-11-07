require 'spec_helper'

describe "characters/new" do
  before(:each) do
    assign(:character, stub_model(Character).as_new_record)
  end

  it "renders new character form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", characters_path, "post" do
    end
  end
end
