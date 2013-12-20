class QuizSession < ActiveRecord::Base
  has_many :quiz_session_questions
  belongs_to :user

  validates_presence_of :user_id, :object_type

  after_create :create_questions

  def cards
    Card.where(object_type: object_type)
  end

  private

  def create_questions
    cards.each do |card|
      quiz_session_questions << QuizSessionQuestion.new(card: card, user: user)
    end
  end
  # finished? method
end
