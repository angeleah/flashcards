class QuizSessionQuestion < ActiveRecord::Base
  belongs_to :quiz_session
  belongs_to :user

  validates :user_id, :card_id, :quiz_session_id, presence: true
end
