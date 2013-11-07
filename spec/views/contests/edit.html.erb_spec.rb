require 'spec_helper'

describe "contests/edit" do
  before(:each) do
    @contest = assign(:contest, stub_model(Contest))
  end

  it "renders the edit contest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contest_path(@contest), "post" do
    end
  end
end
