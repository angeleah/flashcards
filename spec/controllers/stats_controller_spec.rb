require 'spec_helper'

describe StatsController do
  context "when authenticated" do
    before(:each) do
      @user = User.create!( email: "coolperson@coolperson.com" , password: "coolpants")
      @user.confirm!
      sign_in @user
      Card.destroy_all
      create_ruby_cards
      @qs = QuizSession.create!(category: "Ruby", object_type: "Array", user: @user)
    end

    describe "GET #stats" do
      before(:each) do
        @qs.questions.each do |q|
          q.update!(correct: true)
        end
        get :show, id: @qs.id
      end

      it { should render_template(:show) }
      it { expect(assigns(:quiz_session)).not_to be_nil }
      it { expect(assigns(:correct)).not_to be_nil }
      it { expect(assigns(:question_total)).not_to be_nil }

    end

    describe "GET #index" do
      before(:each) do
        create_clojure_card
        QuizSession.create!(category: "Ruby", object_type: "Array", user: @user)
        QuizSession.create!(category: "Ruby", object_type: "Array", user: @user)
        QuizSession.create!(category: "Clojure", object_type: "Core", user: @user)
        QuizSession.create!(category: "Ruby", object_type: "File", user: @user)
        get :index
      end

      it { should render_template(:index) }
      it { expect(assigns(:past_quizzes).count).to eq(5) }
    end
  end
end
#TODO: make assigns test values other than nil through the app.
#TODO: integration testing.
#TODO: Factory girl.
