module QuestionsHelper
  
  def hidden?
    @question.hidden
  end

  def splited_question_body(question_body)
    question_body.split("\n")
  end

  def splited_answer(answer)
    answer.split("\n")
  end
end
