require 'spec_helper'

describe QuizSession do
  context "associations" do

    # before(:each) do
    #   @user = User.create
    # end
    # it "belongs to a user" do

    # end
  end

  describe "validations" do
    it { should validate_presence_of(:user_id) }
  end
end
