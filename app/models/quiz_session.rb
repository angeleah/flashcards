class QuizSession < ActiveRecord::Base
  has_many :questions
  belongs_to :user

  validates_presence_of :user_id, :object_type, :category

  after_create :create_questions

  def cards
    Card.where(category: category, object_type: object_type)
  end

  def finished?
    unanswered.length < 1
  end

  def get_question
    unanswered.sample
  end

  def unanswered
    questions.map{ |q| q if q.correct.nil? }.compact
  end

  private

  def create_questions
    cards.each do |card|
      questions << Question.new(card: card, user: user )
    end
  end
end
