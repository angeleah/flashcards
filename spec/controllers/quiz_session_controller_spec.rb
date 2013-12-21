require 'spec_helper'

describe QuizSessionsController do

  context "when authenticated" do
    before(:each) do
      @user = User.create!( email: "coolperson@coolperson.com" , password: "coolpants")
      @user.confirm!
      sign_in @user
    end

    describe "POST #create" do
      context "with correct params" do
        before { post :create, object_type: "Array" }

        it { should redirect_to(quiz_session_path(QuizSession.last)) }
        it { expect(assigns(:quiz_session)).not_to be_nil }
      end

      context "without correct params" do
        before { post :create }
        it { should redirect_to(root_path) }
        it { expect(flash[:alert]).to eq("There was a problem.") }
      end
    end

    describe "GET #stats" do

      before(:each) do
        Card.destroy_all
        create_cards
      end
    end
  end
end
