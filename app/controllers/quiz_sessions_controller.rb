class QuizSessionsController < ApplicationController

  before_filter :authenticate_user!

  def create
    quiz_type = params[:object_type]
    quiz_category = params[:category]
    quiz_session = QuizSession.create(user_id: current_user.id, category: quiz_category, object_type: quiz_type)

    if quiz_session.persisted?
      redirect_to quiz_session_url(quiz_session)
    else
      redirect_to root_url, alert: "There was a problem."
    end
  end

  def show
    @quiz_session = QuizSession.where(id: params[:id], user: current_user).first
    if @quiz_session.finished?
      redirect_to stats_quiz_session_url(@quiz_session)
    else
      @card = @quiz_session.get_question.card
    end
  end

  def stats

  end

  def answer
    submitted_answer = strip_whitespace(params[:submitted_answer].downcase)
    actual_answer = Card.where(id: params[:card]).first.term
    quiz_session = QuizSession.where(id: params[:qs], user: current_user).first
    question_record = quiz_session.questions.where(card_id: params[:card], user: current_user).first
    if submitted_answer == actual_answer
      question_record.update!(answer: submitted_answer, correct: true)
      redirect_to quiz_session_url(quiz_session), alert: "That was correct."
    else
      question_record.update!(answer: submitted_answer, correct: false)
      redirect_to quiz_session_url(quiz_session), alert: "That was incorrect."
    end
  end

  def strip_whitespace(dirty_answer)
    dirty_answer.gsub(/\s+/, "")
  end
end
