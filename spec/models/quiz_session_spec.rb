require 'spec_helper'

describe QuizSession do

  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:object_type) }
  end
end
