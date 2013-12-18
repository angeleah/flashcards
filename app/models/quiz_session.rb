class QuizSession < ActiveRecord::Base
  has_many :quiz_session_questions
  belongs_to :user

  validates_presence_of :user_id, :object_type
end
