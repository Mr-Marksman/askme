class QuestionsController < ApplicationController
  
<<<<<<< HEAD
  before_action :set_question, only: [:update, :destroy, :show, :edit, :hide]

  def create
    @question = Question.create(question_params)

    redirect_to user_path(@question.user), notice: "Your question has created"
=======
  before_action :set_question, only: [:update, :destroy, :show, :edit, :hide, :hidden?]

  def create
    question = Question.create(question_params)

    redirect_to question_path(question), notice: "Your question has created"
>>>>>>> 4ac2bd659353386c0a3544f6164712a829b188b2
  end

  def update
    @question.update(question_params)

<<<<<<< HEAD
    redirect_to user_path(@question.user)
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: "Your question has deleted!"
=======
    redirect_to question_path(@question)
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: "Your question has deleted!"
>>>>>>> 4ac2bd659353386c0a3544f6164712a829b188b2
  end

  def show
  end

  def index
    @questions = Question.all
  end

  def new
<<<<<<< HEAD
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
=======
    @question = Question.new
>>>>>>> 4ac2bd659353386c0a3544f6164712a829b188b2
  end

  def edit
  end

  def hide
    @question.update(hidden: true)

    redirect_to questions_path
  end

  def question_params
    params.require(:question).permit(:body,:user_id, :hidden)
  end

<<<<<<< HEAD
  private

=======
>>>>>>> 4ac2bd659353386c0a3544f6164712a829b188b2
  def set_question
    @question = Question.find(params[:id])
  end
end
