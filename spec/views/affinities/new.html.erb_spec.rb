require 'spec_helper'

describe "affinities/new" do
  before(:each) do
    assign(:affinity, stub_model(Affinity).as_new_record)
  end

  it "renders new affinity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", affinities_path, "post" do
    end
  end
end
