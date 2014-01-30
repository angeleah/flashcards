angeleah = User.create!(email: "angeleah@gmail.com", password: "password", password_confirmation: "password")
angeleah.confirm!

person2 = User.create!(email: "person2@gmail.com", password: "password2", password_confirmation: "password2")
person2.confirm!

Card.create!( terms_attributes: [{term: "-"}, {term: "array difference"}],
 definition: "Returns a new array that is a copy of the original array, removing any items that also appear in other_ary. The order is preserved from the original array.",
 object_type: "Array",
 example: '<pre class="ruby">[ <span class="ruby-value">1</span>, <span class="ruby-value">1</span>, <span class="ruby-value">2</span>, <span class="ruby-value">2</span>, <span class="ruby-value">3</span>, <span class="ruby-value">3</span>, <span class="ruby-value">4</span>, <span class="ruby-value">5</span> ] <span class="ruby-operator">-</span> [ <span class="ruby-value">1</span>, <span class="ruby-value">2</span>, <span class="ruby-value">4</span> ]  <span class="ruby-comment">#=&gt;  [ 3, 3, 5 ]</span>
</pre>',
 return_type: "new Array",
 category: "Ruby")

Card.create!(terms_attributes: [{term: "compact"}],
 definition: "Returns a copy of self with all nil elements removed.",
 object_type: "Array",
 example: '<pre class="ruby">[ <span class="ruby-string">"a"</span>, <span class="ruby-keyword">nil</span>, <span class="ruby-string">"b"</span>, <span class="ruby-keyword">nil</span>, <span class="ruby-string">"c"</span>, <span class="ruby-keyword">nil</span> ].<span class="ruby-identifier">compact</span>
                  <span class="ruby-comment">#=&gt; [ "a", "b", "c" ]</span>
</pre>',
 return_type: "new Array",
 category: "Ruby")

Card.create!(terms_attributes: [{term: "exist?"}],
 definition: "Return true if the named file exists.",
 object_type: "File",
 example: "nil",
 return_type: "Boolean",
 category: "Ruby")

Card.create!(terms_attributes: [{term: "find"}],
 definition: "Returns the map entry for key, or nil if key not present.",
 object_type: "Core",
 example: '<td class="content"><code class="plain">user=&gt; </code><code class="keyword">(</code><code class="functions">find</code> <code class="keyword">{</code><code class="constants">:b</code> <code class="value">2</code> <code class="constants">:a</code> <code class="value">1</code> <code class="constants">:c</code> <code class="value">3</code><code class="keyword">}</code> <code class="constants">:d</code><code class="keyword">)</code></td>',
 return_type: "map",
 category: "Clojure")
