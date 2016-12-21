class QuestionsController < ApplicationController
  before_action :signed_in_user, only: [:create, :new]
  before_action :admin_user,     only: :destroy

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
    Question.find(params[:id]).destroy
    flash[:success] = "Question deleted."
    redirect_to questions_url
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
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

  def admin_user
    redirect_to(signin_path) unless current_user.admin?
  end
end