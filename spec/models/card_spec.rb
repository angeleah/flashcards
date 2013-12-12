require 'spec_helper'

describe Card do
  describe "validtions" do
    it { should validate_presence_of(:term) }
    it { should validate_presence_of(:definition)}
    it { should validate_presence_of(:object_type) }
    it { should validate_presence_of(:example)}
    it { should validate_presence_of(:return_type)}
  end

  describe "scopes" do

    before(:each) do
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
    end

    it "returns a unique array of object_types" do
      expect(Card.object_types).to include("File")
      expect(Card.object_types).to include("Array")
    end

  end
end
