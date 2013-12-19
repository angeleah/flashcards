class QuizSession < ActiveRecord::Base
  has_many :quiz_session_questions
  belongs_to :user

  validates_presence_of :user_id, :object_type

  def create_quiz_session_questions
    cards.each do |card|
      quiz_session_questions << QuizSessionQuestion.new(card: card, user: user)
    end
  end

  def cards
    Card.where(object_type: object_type)
  end

  # finished? method
end
