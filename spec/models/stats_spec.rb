require 'spec_helper'

describe Stats do
  context "validations" do
    it { should validate_presence_of(:user_id)}
    it { should validate_presence_of(:card_id)}
    it { should validate_presence_of(:quiz_session_id)}
  end

  context
end
