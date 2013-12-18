require 'spec_helper'

describe QuizSessionsController do

  before(:each) do
    @user = User.create!( email: "coolperson@coolperson.com" , password: "coolpants")
    @user.confirm!
    sign_in @user
  end

  context "create" do
    it "renders show when successfull" do
      post :create, object_type: "Array"

      response.should redirect_to(quiz_session_path(QuizSession.last))
      assigns[:quiz_session].should_not be_nil
    end

    it "redirects to 'root_path' if there is no quiz_type" do
      post :create

      response.should redirect_to root_path
      flash[:alert].should eq("There was a problem.")
    end
  end

  context "show" do
    # need to mock out the situation?
    it "" do

    end
  end






end

