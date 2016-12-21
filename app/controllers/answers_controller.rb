class AnswersController < ApplicationController
  before_action :signed_in_user

  def create
    @answer = current_user.answers.build(answer_params)
    if @answer.save
      result = @answer.as_json
      result['user_avatar'] = @answer.answerer.avatar.small.to_s
      result['user_path'] = user_path(@answer.answerer)
      result['user_name'] = @answer.answerer.name.to_s
      result['time'] = "Posted now."
      respond_to do |format|
        format.json { render json: result }
      end
    end

  end

  def destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id, :answerer_id)
  end
end