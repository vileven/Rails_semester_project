class LikesController < ApplicationController
  before_action :signed_in_user

  def new
    @answer = Answer.find(params[:answer_id])
    current_user.like!(@answer)
    # respond_to do |format|
    #   format.json { render json: @answer.likes.count }
    # end
    render_to_string "#{@answer.likes.count}"
  end

  def destroy
    @answer = Like.find(answer_id: params[:answer_id], user_id: current_user.id)
    current_user.dislike!(@answer)
    respond_to do |format|
      format.json { render json: @answer.likes.count }
    end
  end
end