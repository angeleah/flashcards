require 'spec_helper'

describe QuizSession do
  let(:user) { User.create!( email: "coolperson@coolperson.com" , password: "coolpants") }
  let(:qs) { QuizSession.create!(object_type: "Array", user: user) }
  let(:expected_cards) { Card.where(object_type: "Array") }

  before(:all) do
    Card.destroy_all
    create_cards
  end

  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:object_type) }
  end

  describe "after_create" do
    it "creates the quiz session questions" do
      quiz_session = QuizSession.create!(object_type: "Array", user: user)
      expect(quiz_session.questions.map(&:card_id)).to match_array(expected_cards.map(&:id))
    end
  end

  describe "cards" do
    it { expect(qs.cards).to eq(expected_cards) }
  end

  describe "finished quiz session" do
    before(:each) do
      qs.questions.each do |q|
        q.update!(correct: true)
      end
    end

    it { expect(qs.finished?).to be_true }
  end

  describe "unfinished quiz_session" do
    it { expect(qs.finished?).to be_false }
  end
end
