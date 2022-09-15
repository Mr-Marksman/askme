module QuestionsHelper
  def hidden?
    @question.hidden
  end

  def splited_text(text)
    text.lines
  end
end
