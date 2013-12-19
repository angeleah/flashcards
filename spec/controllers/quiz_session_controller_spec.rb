require 'spec_helper'

describe QuizSessionsController do

  describe "actions" do

    context "signed_in user" do
      before(:each) do
        @user = User.create!( email: "coolperson@coolperson.com" , password: "coolpants")
        @user.confirm!
        sign_in @user
      end

      describe "create" do
        context "with correct params" do
          before(:each) do
            post :create, object_type: "Array"
          end

          it "renders show when successfull" do
            response.should redirect_to(quiz_session_path(QuizSession.last))
          end

          it "creates a quiz session" do
            assigns[:quiz_session].should_not be_nil
          end
        end

        context "without correct params"
          it "redirects to 'root_path' if quiz_type is missing" do
            post :create

            response.should redirect_to root_path
            flash[:alert].should eq("There was a problem.")
          end
        end
      end

      describe "stats" do
        let(:qs) { QuizSession.new }

      end
    end
  end

