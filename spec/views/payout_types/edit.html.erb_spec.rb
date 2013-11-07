require 'spec_helper'

describe "payout_types/edit" do
  before(:each) do
    @payout_type = assign(:payout_type, stub_model(PayoutType))
  end

  it "renders the edit payout_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", payout_type_path(@payout_type), "post" do
    end
  end
end
