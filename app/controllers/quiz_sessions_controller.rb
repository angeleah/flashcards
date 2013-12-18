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

  def show

  end


  #need to get all the questions and answers
  #shuffle them
  # (maybe I need to use JS to layer them on top of eachother and then )
  #allow them to quiz themself
  #have an I'm finished button?
  #that is all of the methods notice if at the end?

end
