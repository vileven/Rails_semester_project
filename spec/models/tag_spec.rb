require 'spec_helper'

describe Tag do

  let(:user) { FactoryGirl.create(:user) }
  let(:question) { user.questions.build(title: "Hello", content: "Lorem Ispum") }
  before { @tag = Tag.create(name: "NN") }

  subject { @tag }

  it { should respond_to(:questions) }

  describe "create tag using question" do
    before { question.tags.build(name: "kek") }
    it { should be_valid }
  end

  describe "add question to collection tags" do
    before { @tag.questions << question }
    it { should be_valid }
  end



end

describe "tags validation" do
  it "dadsf" do
    @tags = '#NN, #Python, #Regression'
    @tags = @tags.sub(',', ' ')
    @tags = @tags.gsub(/[^\w\s]/, "")
    @tags = @tags.gsub(/\s+/, " ")

    expect(@tags.split).to eq ["NN", "Python", "Regression"]
  end
  # tags = sub(r"[^\w\s]", "", tags)
  # tags = sub(r"\s+", " ", tags)
end