class QuizSession < ActiveRecord::Base
  has_many :stats
  belongs_to :user

  validates :user_id, presence: true

end
