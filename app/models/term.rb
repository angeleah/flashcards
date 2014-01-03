class Term < ActiveRecord::Base
  belongs_to :card
  validates :term, :card, presence: true
end
