require 'spec_helper'

describe "characters/edit" do
  before(:each) do
    @character = assign(:character, stub_model(Character))
  end

  it "renders the edit character form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", character_path(@character), "post" do
    end
  end
end
