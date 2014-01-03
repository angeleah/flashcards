require 'spec_helper'

describe Term do
  describe "validations" do
    it { should validate_presence_of(:term) }
    it { should validate_presence_of(:card) }
  end
end
