class Question < ActiveRecord::Base
  belongs_to :quiz_session
  belongs_to :user
  belongs_to :card

  validates :user_id, :card_id, :quiz_session_id, presence: true
end
