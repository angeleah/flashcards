require 'spec_helper'

describe Card do
  describe "valid data" do
    before(:each) do
      @card = Card.create!({term: "zip",
        object_type: "Array",
        definition: "Converts any arguments into arrays, then merges elements of self with corresponding elements form each argument.",
        example: "Cool"})
      end
    it "has a term" do
      expect(@card.term).to eq("zip")
    end

    it "has an object type" do
      expect(@card.object_type).to eq("Array")
    end

    it "has a definition" do
      expect(@card.definition).to eq("Converts any arguments into arrays, then merges elements of self with corresponding elements form each argument.")
    end


    it "has an example" do
      expect(@card.example).to eq("Cool")
    end
  end
end
