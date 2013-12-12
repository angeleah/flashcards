class Card < ActiveRecord::Base

  validates :term, :definition, :object_type, :example, :return_type, presence: true

  scope :object_types, -> { select("object_type").collect(&:object_type).uniq! }

end
