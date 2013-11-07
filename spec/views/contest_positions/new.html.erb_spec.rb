require 'spec_helper'

describe "contest_positions/new" do
  before(:each) do
    assign(:contest_position, stub_model(ContestPosition).as_new_record)
  end

  it "renders new contest_position form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contest_positions_path, "post" do
    end
  end
end
