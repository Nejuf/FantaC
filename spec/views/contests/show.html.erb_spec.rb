require 'spec_helper'

describe "contests/show" do
  before(:each) do
    @contest = assign(:contest, stub_model(Contest))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
