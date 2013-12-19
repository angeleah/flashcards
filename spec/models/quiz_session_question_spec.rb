require 'spec_helper'

describe QuizSessionQuestion do
  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:card_id) }
    it { should validate_presence_of(:quiz_session_id) }
  end

  describe "associations" do
    it { should belong_to :quiz_session }
    it { should belong_to :user }
    it { should belong_to :card }
  end
end
