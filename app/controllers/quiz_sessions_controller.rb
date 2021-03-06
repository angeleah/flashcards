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
      redirect_to stat_path(@quiz_session)
    else
      @card = @quiz_session.get_question.card
    end
  end

  def answer
    submitted_answer = strip_whitespace(params[:submitted_answer].downcase)

    quiz_session = QuizSession.where(id: params[:id], user: current_user).first
    question_record = quiz_session.questions.where(card_id: params[:card], user: current_user).first

    if correct_answer?(submitted_answer)
      question_record.update!(answer: submitted_answer, correct: true)
      redirect_to quiz_session_url(quiz_session), alert: "That was correct."
    else
      question_record.update!(answer: submitted_answer, correct: false)
      redirect_to quiz_session_url(quiz_session), alert: "That was incorrect. The correct answer was #{possible_answers.join(" or ")}."
    end
  end

  def unfinished
    @unfinished_quizzes ||= QuizSession.where(user: current_user).collect{ |qs| qs if !qs.finished? }.compact
    @total_quiz_count = QuizSession.where(user: current_user).count
    if @total_quiz_count >= 1
      @unfinished_percentage = ((@unfinished_quizzes.count.to_f / @total_quiz_count.to_f) * 100).round
      @finished_percentage = 100 - @unfinished_percentage
    end
  end

  private

  def possible_answers
    Card.where(id: params[:card]).first.terms.map { |term| strip_whitespace(term.term.downcase) }
  end

  def strip_whitespace(dirty_answer)
    dirty_answer.gsub(/\s+/, "")
  end

  def correct_answer?(submitted_answer)
    possible_answers.each do |answer|
      return true if submitted_answer == answer
    end
    false
  end
end
