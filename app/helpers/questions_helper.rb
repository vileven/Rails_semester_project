module QuestionsHelper
  def short_qs_content(str)
    if str.length > 120
      str[0..120] + '...'
    else
      str
    end
  end
end