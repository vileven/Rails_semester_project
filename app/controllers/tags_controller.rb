class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @questions = @tag.questions.paginate(page: params[:page], per_page: 20)
  end
end