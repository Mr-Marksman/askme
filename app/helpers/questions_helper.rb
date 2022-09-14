module QuestionsHelper
  def hidden?
    @question.hidden
  end

  def splited_text(text)
    text.lines
  end

  def text_with_hashtags(text)
    text.gsub(/#[[:word:]-]+/) { |hashtag_body| link_to hashtag_body, hashtag_path(hashtag_body) }.html_safe
  end
end
