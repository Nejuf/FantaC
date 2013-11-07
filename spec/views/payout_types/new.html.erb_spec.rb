require 'spec_helper'

describe "payout_types/new" do
  before(:each) do
    assign(:payout_type, stub_model(PayoutType).as_new_record)
  end

  it "renders new payout_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", payout_types_path, "post" do
    end
  end
end
