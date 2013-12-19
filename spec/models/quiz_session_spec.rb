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
    it { expect(qs.cards).to eq(expected_cards) }
  end

  describe "create_quiz_session_questions" do
    it { expect(qs.create_quiz_session_questions.map(&:id)).to match_array(expected_cards.map(&:id)) }
    it { expect(qs.create_quiz_session_questions.length).to eq(expected_cards.length) }
  end
end
