require File.dirname(__FILE__) + '/../spec_helper'

describe Book do
  it "should be valid" do
    Book.new.should be_valid
  end
end
