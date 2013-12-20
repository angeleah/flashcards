require 'spec_helper'

describe Card do
  describe "validtions" do
    it { should validate_presence_of(:term) }
    it { should validate_presence_of(:definition) }
    it { should validate_presence_of(:object_type) }
    it { should validate_presence_of(:example) }
    it { should validate_presence_of(:return_type) }
  end

  describe ".object_types" do
    before(:all) do
      Card.destroy_all
      create_cards
    end
    subject(:unique_object_types) { Card.object_types }
    it { should match_array(["Array", "File"]) }
  end
end
