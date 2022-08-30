class QuestionsController < ApplicationController
  
  before_action :set_question, only: [:update, :destroy, :show, :edit, :hide]

  def create
    @question = Question.create(question_params)

    redirect_to user_path(@question.user), notice: "Your question has created"
  end

  def update
    @question.update(question_params)

    redirect_to user_path(@question.user)
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: "Your question has deleted!"
  end

  def show
  end

  def index
    @questions = Question.all
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
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

  private

  def set_question
    @question = Question.find(params[:id])
  end
end
