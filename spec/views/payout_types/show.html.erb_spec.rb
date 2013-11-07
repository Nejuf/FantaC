require 'spec_helper'

describe "payout_types/show" do
  before(:each) do
    @payout_type = assign(:payout_type, stub_model(PayoutType))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
