require 'spec_helper'

describe QuizSession do
  let(:qs) { QuizSession.new(object_type: "Array") }
  let(:expected_cards) { Card.where(object_type: "Array") }

  before(:all) do
    create_cards
  end

  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:object_type) }
  end

  describe "cards" do
    it "returns cards with the correct object type" do
      expect(qs.cards).to eq(expected_cards)
    end
  end

  describe "initialize" do
    it "has a quiz session question for each card" do
      expect(qs.quiz_session_questions.map(&:card_id)).to match_array(expected_cards.map(&:id))
      # expect(qs.quiz_session_questions.length).to eq(expected_cards.length)
    end
  end
end
