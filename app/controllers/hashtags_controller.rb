class HashtagsController < ApplicationController
  before_action :set_hashtag, only: %i[ show ]

  def show
    @questions = @hashtag.questions
  end

  private

    def set_hashtag
      @hashtag = Hashtag.find_by!(body: params[:body])
    end
end
