require 'spec_helper'

describe Answer do

  let(:user) { FactoryGirl.create(:user) }
  let(:question) { user.questions.build(title: "Hello", content: "Lorem Ispum") }

  before { @answer = question.answers.build(content: "Lorem Ispum", answerer_id: user.id) }



  subject { @answer }

  it { should respond_to(:content) }
  it { should respond_to(:answerer_id) }
  it { should respond_to(:question_id) }
  it { should respond_to(:question) }
  it { should respond_to(:answerer)}
  it { should respond_to(:likes) }
  it { should respond_to(:liked_users) }


  describe "when answerer_id is not present" do
    before { @answer.answerer_id = nil }
    it { should_not be_valid }
  end

  describe "when question_id is not present" do
    before { @answer.question_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @answer.content = " " }
    it { should_not be_valid }
  end


end