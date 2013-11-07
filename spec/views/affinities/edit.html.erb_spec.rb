require 'spec_helper'

describe "affinities/edit" do
  before(:each) do
    @affinity = assign(:affinity, stub_model(Affinity))
  end

  it "renders the edit affinity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", affinity_path(@affinity), "post" do
    end
  end
end
