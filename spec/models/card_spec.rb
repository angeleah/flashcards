require 'spec_helper'

describe Card do
  describe "validtions" do
    it { should validate_presence_of(:term) }
    it { should validate_presence_of(:definition) }
    it { should validate_presence_of(:object_type) }
    it { should validate_presence_of(:example) }
    it { should validate_presence_of(:return_type) }
    it { should validate_presence_of(:category) }
  end

  before(:all) do
    Card.destroy_all
    create_ruby_cards
    create_clojure_card
  end

  describe ".object_types" do
    subject(:unique_object_types) { Card.object_types }
    it { should match_array(["Array", "File", "Core"]) }
  end

  describe ".categories" do
    subject(:unique_categories) { Card.categories }
    it { should match_array(["Clojure", "Ruby"]) }
  end

  describe ".get_category_object_types"  do
    subject(:unique_category_object_types) { Card.category_object_types("Ruby") }
    it { should match_array(["Array", "File"]) }
  end
end
