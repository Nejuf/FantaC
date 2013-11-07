require 'spec_helper'

describe "tiers/edit" do
  before(:each) do
    @tier = assign(:tier, stub_model(Tier))
  end

  it "renders the edit tier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tier_path(@tier), "post" do
    end
  end
end
