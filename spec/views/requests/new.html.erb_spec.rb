require 'spec_helper'

describe "requests/new.html.erb" do
  before(:each) do
    assign(:request, stub_model(Request,
      :user_id => 1,
      :copy_id => 1,
      :activated => false
    ).as_new_record)
  end

  it "renders new request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => requests_path, :method => "post" do
      assert_select "input#request_user_id", :name => "request[user_id]"
      assert_select "input#request_copy_id", :name => "request[copy_id]"
      assert_select "input#request_activated", :name => "request[activated]"
    end
  end
end
