class QuestionsController < ApplicationController
  before_action :signed_in_user, only: [:create, :new]
  before_action :admin_user,     only: :destroy

  def create
    @question = current_user.questions.build(question_params)
    save_tags_qs(@question)
    if @question.save
      current_user.question_count += 1
      current_user.save
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
    if params[:search]
      @search = params[:search]
      @questions = Question.search(@search).paginate(page: params[:page], per_page: 20)
    else
      @questions = Question.paginate(page: params[:page], per_page: 20)
    end
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

  def save_tags_qs(question)
    params.require(:question).permit(:tags)
    tags = params.require(:question).permit(:tags)[:tags]
    tags = tags.sub(',', ' ')
    tags = tags.gsub(/[^\w\s]/, "")
    tags = tags.gsub(/\s+/, " ")
    tags.split.each do |tag|
      tag_ = Tag.where(name: tag)[0]
      if tag_
        tag_.question_count += 1
        tag_.save!
        question.tags << tag_
      else
        question.tags.build(name: tag)
      end
    end
  end
end