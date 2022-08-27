module UsersHelper
  def display_nickname(user)
    "@#{user.nickname}"
  end

  def splited_question_body(question_body)
    question_body.split("\n")
  end
end
