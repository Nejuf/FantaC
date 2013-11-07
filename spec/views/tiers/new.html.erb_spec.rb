require 'spec_helper'

describe "tiers/new" do
  before(:each) do
    assign(:tier, stub_model(Tier).as_new_record)
  end

  it "renders new tier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tiers_path, "post" do
    end
  end
end
