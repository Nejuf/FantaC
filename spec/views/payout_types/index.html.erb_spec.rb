require 'spec_helper'

describe "payout_types/index" do
  before(:each) do
    assign(:payout_types, [
      stub_model(PayoutType),
      stub_model(PayoutType)
    ])
  end

  it "renders a list of payout_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
