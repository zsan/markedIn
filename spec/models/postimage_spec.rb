require 'spec_helper'

describe Postimage do
  let(:user) { FactoryGirl.create(:user)}
  let(:micropost) { FactoryGirl.create(:micropost, user: user) }

  before do 
  	@postimage = micropost.postimages.build(name: "test")
  end

  subject { @postimage }

  it { should respond_to(:micropost_id)}
  it { should respond_to(:name)}
  it { should respond_to(:micropost)}
  its(:micropost) { should == micropost }


  it { should be_valid }

  
  describe "accessible attributes" do
  	it "should not allow access to micropost_id" do
  	  expect do
  	  	Postimage.new(micropost_id: micropost.id, name: "Lorem Ipsum")
  	  end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end

  describe "when micropost_id is not present" do
  	before { @postimage.micropost_id = nil }
  	it { should_not be_valid }
  end

end
