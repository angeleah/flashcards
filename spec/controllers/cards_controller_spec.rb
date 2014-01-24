require 'spec_helper'

describe CardsController do

 let(:card_attributes) do
  {
    terms_attributes: [
      { term: "-"},
      { term: "array difference"}
      ],
      definition: "Hello",
      object_type: "Array",
      example: 'hello',
      return_type: "new Array",
      category: "Ruby"
    }
  end

  let(:card) { Card.create!(card_attributes) }

  before(:each) do
    @user = User.create!( email: "angeleah@gmail.com" , password: "coolpants")
    @user.confirm!
    sign_in @user
    Card.destroy_all
  end

  describe "GET index" do
    it "gets all the cards" do
      get :index
      assigns(:cards).should eq([card])
    end
  end

  describe "GET show" do
    it "assigns the requested card as @card" do
      get :show, {:id => card.to_param}
      assigns(:card).should eq(card)
    end
  end

  describe "GET new" do
    it "assigns a new card as @card" do
      get :new
      assigns(:card).should be_a_new(Card)
    end
  end

  describe "GET edit" do
    it "assigns the requested card as @card" do
      get :edit, {id: card.to_param}
      assigns(:card).should eq(card)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Card" do
        expect {
          post :create, {card: card_attributes}
          }.to change(Card, :count).by(1)
        end

        it "assigns a newly created card as @card" do
          post :create, {card: card_attributes}
          assigns(:card).should be_a(Card)
          assigns(:card).should be_persisted
        end

        it "redirects to the created card" do
          post :create, {card: card_attributes}
          response.should redirect_to(Card.last)
        end
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved card as @card" do
      # Trigger the behavior that occurs when invalid params are submitted
      Card.any_instance.stub(:save).and_return(false)
      post :create, {:card => { definition: "invalid value" }}
      assigns(:card).should be_a_new(Card)
    end

    it "re-renders the 'new' template" do
      # Trigger the behavior that occurs when invalid params are submitted
      Card.any_instance.stub(:save).and_return(false)
      post :create, {:card => { definition: "invalid value" }}
      response.should render_template("new")
    end
  end


  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested card" do
        # Assuming there are no other cards in the database, this
        # specifies that the Card created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Card.any_instance.should_receive(:update).with({ "definition" => "MyString" })
        put :update, {:id => card.to_param, :card => { definition: "MyString" }}
      end

      it "assigns the requested card as @card" do
        put :update, {:id => card.to_param, card: card_attributes}
        assigns(:card).should eq(card)
      end

      it "redirects to the card" do
        put :update, {:id => card.to_param, card: card_attributes }
        response.should redirect_to(card)
      end
    end

    describe "with invalid params" do
      it "assigns the card as @card" do
      # Trigger the behavior that occurs when invalid params are submitted
      Card.any_instance.stub(:save).and_return(false)
      put  :update, {:id => card.to_param,card: { definition: "invalid value" }}
      assigns(:card).should eq(card)
    end

    it "re-renders the 'edit' template" do
      # Trigger the behavior that occurs when invalid params are submitted
      Card.any_instance.stub(:save).and_return(false)
      put :update, {:id => card.to_param, card: { definition: "invalid value" }}
      response.should render_template("edit")
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested card" do
      card
      expect {
        delete :destroy, {:id => card.to_param}
        }.to change(Card, :count).by(-1)
      end

      it "redirects to the cards list" do
        card
        delete :destroy, {:id => card.to_param}
        response.should redirect_to(cards_url)
      end
    end
  end
end
