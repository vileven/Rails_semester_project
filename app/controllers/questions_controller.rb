class QuestionsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :new]

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "Question created!"
      redirect_to question_path(@question)
    else
      render 'questions/new'
    end
  end

  def destroy
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.paginate(page: params[:page], per_page: 20)
  end

  def new
    @question = Question.new
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end