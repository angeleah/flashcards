require 'spec_helper'

describe User do
  context "validations" do
    it { should validate_presence_of(:email)}
  end

  context "associations" do
    it {should have_many(:quiz_sessions)}
  end
end
