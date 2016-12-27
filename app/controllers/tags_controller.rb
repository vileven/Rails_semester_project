class TagsController < ApplicationController
  def show
    @tag = Tag.where(id: params[:id])[0]
    unless @tag
      redirect_to(root_path)
      flash[:warning] = "Tag doesn't exist"
    else
      @questions = @tag.questions.paginate(page: params[:page], per_page: 20)
    end
  end
end