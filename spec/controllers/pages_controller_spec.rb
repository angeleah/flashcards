require 'spec_helper'

describe PagesController do

  describe "authenticated user" do
    context "home" do
      before(:each) do
        @current_user = User.create!(email: "coolperson@coolperson.com", password: "coolperson")
        @current_user.confirm!
        sign_in @current_user
      end

      it "renders the template" do
        get :home
        expect(response).to render_template("home")
      end

      it "responds with a 200" do
        get :home
        expect(response.status).to eq(200)
      end

      it "loads the user" do
        get :home
        expect(assigns[:user]).to eq(@current_user)
      end

      it "loads the object_types of the cards" do
        Card.create!(term: "array difference",
         definition: "Returns a new array that is a copy of the original array, removing any items that also appear in other_ary. The order is preserved from the original array.",
         object_type: "Array",
         example: '<pre class="ruby">[ <span class="ruby-value">1</span>, <span class="ruby-value">1</span>, <span class="ruby-value">2</span>, <span class="ruby-value">2</span>, <span class="ruby-value">3</span>, <span class="ruby-value">3</span>, <span class="ruby-value">4</span>, <span class="ruby-value">5</span> ] <span class="ruby-operator">-</span> [ <span class="ruby-value">1</span>, <span class="ruby-value">2</span>, <span class="ruby-value">4</span> ]  <span class="ruby-comment">#=&gt;  [ 3, 3, 5 ]</span>
        </pre>',
         return_type: "new Array")

        Card.create!(term: "compact",
         definition: "Returns a copy of self with all nil elements removed.",
         object_type: "Array",
         example: '<pre class="ruby">[ <span class="ruby-string">"a"</span>, <span class="ruby-keyword">nil</span>, <span class="ruby-string">"b"</span>, <span class="ruby-keyword">nil</span>, <span class="ruby-string">"c"</span>, <span class="ruby-keyword">nil</span> ].<span class="ruby-identifier">compact</span>
                          <span class="ruby-comment">#=&gt; [ "a", "b", "c" ]</span>
        </pre>',
         return_type: "new Array")

        Card.create!(term: "exist?",
         definition: "Return true if the named file exists.",
         object_type: "File",
         example: "nil",
         return_type: "Boolean")

        get :home

        expect(assigns[:object_type]).to include("Array")
      end
    end
  end
end
