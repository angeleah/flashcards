require 'spec_helper'

describe QuizSessionsController do

  before(:each) do
    @current_user = User.create!( email: "coolperson@coolperson.com" , password: "coolpants")
  end

  context "create" do
    it "renders show" do
      post :create, user_id: @current_user.id , start: Time.now

      expect(response).to redirect_to("show")
    end
  end

end

#TODO stubbing time for calculations later on. ?!

