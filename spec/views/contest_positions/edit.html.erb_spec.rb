require 'spec_helper'

describe "contest_positions/edit" do
  before(:each) do
    @contest_position = assign(:contest_position, stub_model(ContestPosition))
  end

  it "renders the edit contest_position form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contest_position_path(@contest_position), "post" do
    end
  end
end
