# spec/models/contact.rb
require 'rails_helper'

RSpec.describe Post , :type => :model do
  it "has a valid factory" do
    FactoryGirl.create(:post).should be_valid
  end
  it "is invalid without a text" do
  	FactoryGirl.build(:post, text: nil).should_not be_valid
  end 
end