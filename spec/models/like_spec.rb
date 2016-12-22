require 'spec_helper'

describe Like do

  let(:user) { FactoryGirl.create(:user) }
  let(:answer) { FactoryGirl.create(:answer) }
  let(:like) { user.likes.build(answer_id: answer.id) }

  subject { like }

  it { should be_valid }
  describe "user, answer methods" do
    it { should respond_to(:user) }
    it { should respond_to(:answer) }
    its(:user) { should eq user }
    its(:answer) { should eq answer }
  end

  describe "when user id is not present" do
    before { like.user_id = nil }
    it { should_not be_valid }
  end

  describe "when answer id is not present" do
    before { like.answer_id = nil }
    it { should_not be_valid }
  end
end