class QuizSessionsController < ApplicationController

  before_filter :authenticate_user!

  def create
    quiz_type = params[:object_type]
    @quiz_session = QuizSession.create(user_id: current_user.id, start: Time.now, object_type: quiz_type)

    if @quiz_session.persisted?
      redirect_to quiz_session_path(@quiz_session)
    else
      redirect_to root_path, alert: "There was a problem."
    end
  end


end
