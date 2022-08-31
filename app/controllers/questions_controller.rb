class QuestionsController < ApplicationController
  before_action :set_question, only: [:update, :destroy, :show, :edit, :hide]

  def create
    question_params = params.require(:question).permit(:body, :user_id, :topic, :hidden)

    @question = Question.new(question_params)

    if @question.save
      redirect_to user_path(@question.user), notice: "Your question has created!"
    else
      flash.now[:alert] = "You filled in the question form incorrectly"

      render :new
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :answer, :topic :hidden)

    if @question.update(question_params)
      redirect_to user_path(@question.user), notice: "Your question has updated!"
    else
      flash.now[:alert] = "You filled in the question form incorrectly"

      render :edit
    end
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

  private

  def set_question
    @question = Question.find(params[:id])
  end
end
