module ApplicationHelper
  def top_tags
    Tag.order('question_count DESC').limit(7)
  end

  def top_members
    User.order('question_count DESC').limit(5)
  end
end
