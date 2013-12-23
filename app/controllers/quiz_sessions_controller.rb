class QuizSessionsController < ApplicationController

  before_filter :authenticate_user!

  def create
    quiz_type = params[:object_type]
    quiz_session = QuizSession.create(user_id: current_user.id, start: Time.now, object_type: quiz_type)

    if quiz_session.persisted?
      redirect_to quiz_session_url(quiz_session)
    else
      redirect_to root_url, alert: "There was a problem."
    end
  end

  def show
    quiz_session = QuizSession.where(id: params[:id], user: current_user).first
    if quiz_session.finished?
      redirect_to stats_quiz_session_url(quiz_session)
    else
      @card = quiz_session.get_question.card
    end
  end

  def stats

  end

  def answer

  end


end
