class Card < ActiveRecord::Base

  validates :term, :definition, :object_type, :example, :return_type, presence: true
end
