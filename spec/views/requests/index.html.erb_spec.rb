require 'spec_helper'

describe "requests/index.html.erb" do
  before(:each) do
    assign(:requests, [
      stub_model(Request,
        :user_id => 1,
        :copy_id => 1,
        :activated => false
      ),
      stub_model(Request,
        :user_id => 1,
        :copy_id => 1,
        :activated => false
      )
    ])
  end

  it "renders a list of requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
