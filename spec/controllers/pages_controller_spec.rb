require 'spec_helper'

describe PagesController do

  context "when authenticated" do
    before(:each) do
      @current_user = User.create!(email: "coolperson@coolperson.com", password: "coolperson")
      @current_user.confirm!
      sign_in @current_user
    end

    describe "GET #home" do
      before(:all) do
        Card.destroy_all
        create_ruby_cards
        create_clojure_card
      end
      before { get :home }

      it { should render_template :home }
      it { should respond_with 200 }
      it { expect(assigns(:user)).to eq(@current_user) }

      it { expect(assigns(:category)).to match_array(["Ruby", "Clojure"]) }
      it { expect(assigns(:object_type)).to match_array(["Array", "Core", "File"]) }
    end
  end
end
