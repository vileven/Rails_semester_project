require 'spec_helper'

describe "Question pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "question creation" do
    before { visit new_question_path }

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "ASK!" }.not_to change(Question, :count)
      end

      describe "error messages" do
        before { click_button "ASK!" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before do
        fill_in 'question_title', with: "Hello"
        fill_in 'question_content', with: "Lorem ipsum"
      end

      it "should create a question" do
        expect { click_button "ASK!" }.to change(Question, :count).by(1)
      end
    end
  end
end