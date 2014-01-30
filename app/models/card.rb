class Card < ActiveRecord::Base
  has_many :terms, :inverse_of => :card
  accepts_nested_attributes_for :terms
  validates :terms, :definition, :category, :object_type, :example, :return_type, presence: true

  def self.object_types
    order("object_type").pluck("distinct object_type")
  end

  def self.categories
    select("category").collect(&:category).uniq!.sort
  end

  def self.category_object_types(category)
    where(category: category).pluck(:object_type).uniq
  end
end
