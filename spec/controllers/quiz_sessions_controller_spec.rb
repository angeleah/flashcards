require 'spec_helper'

describe QuizSessionsController do

  context "when authenticated" do
    before(:each) do
      @user = User.create!( email: "coolperson@coolperson.com" , password: "coolpants")
      @user.confirm!
      sign_in @user
      Card.destroy_all
      create_ruby_cards
      @qs = QuizSession.create!(category: "Ruby", object_type: "Array", user: @user)
    end

    describe "POST #create" do
      context "with correct params" do
        before { post :create, category: "Ruby", object_type: "Array" }

        it { should redirect_to(quiz_session_path(QuizSession.last)) }
      end

      context "without correct params" do
        before { post :create }
        it { should redirect_to(root_path) }
        it { expect(flash[:alert]).to eq("There was a problem.") }
      end
    end

    describe "show" do
      context "when quiz is finished" do
        before(:each) do
          @qs.questions.each do |q|
            q.update!(correct: true)
          end
          get :show, id: @qs.id
        end

        it { should redirect_to(stats_quiz_session_path(@qs)) }
      end

      context "when quiz is not finished" do
          before { get :show, id: @qs.id }

          it { should render_template(:show) }
          it { expect(assigns(:card)).not_to be_nil }
      end
    end

    describe "GET #stats" do
      before(:each) do
        @qs.questions.each do |q|
          q.update!(correct: true)
        end
        get :stats, id: @qs.id
      end

      it { should render_template(:stats) }
    end

    describe "POST answer" do
      let(:current_card) { @qs.questions.first.card_id }

      it "records the submitted answer" do
        post :answer, submitted_answer: "cool_method", card: current_card, qs: @qs.id
        expect(@qs.questions.first.answer).to eq("cool_method")
        expect(@qs.questions.first.correct).to be_false
      end

      it "redirects to quiz session path" do
        post :answer, submitted_answer: "cool_method", card: current_card, qs: @qs.id
        response.should redirect_to(quiz_session_path(@qs))
        expect(flash[:alert]).to eq("That was incorrect.")
      end
    end
  end
end
