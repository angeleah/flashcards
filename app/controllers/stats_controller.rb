class StatsController < ApplicationController

  def index
    @past_quizzes = QuizSession.where(user: current_user).order(created_at: :desc)
  end

  def show
    @quiz_session = QuizSession.where(id: params[:id], user: current_user).first
    @correct = @quiz_session.questions.where(correct: true).count
    @question_total = @quiz_session.questions.count
  end
end
