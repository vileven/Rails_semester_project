require 'spec_helper'

describe Question do

  let(:user) { FactoryGirl.create(:user) }
  before { @question = user.questions.build(title: "Hello", content: "Lorem Ispum") }

  subject { @question }

  it { should respond_to(:content) }
  it { should respond_to(:author_id) }
  it { should respond_to(:title) }

  describe "when author_id is not present" do
    before { @question.author_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @question.content = " " }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { @question.content = " " }
    it { should_not be_valid }
  end

  describe "with title that is too long" do
    before { @question.title = "a" * 150 }
    it { should_not be_valid }
  end
end