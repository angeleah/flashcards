angeleah = User.create!(email: "angeleah@gmail.com", password: "coolpants", password_confirmation: "coolpants")
angeleah.confirm!

dayton = User.create!(email: "dayton@gmail.com", password: "coolpants2", password_confirmation: "coolpants2")
dayton.confirm!


Card.create!(term: "array difference",
 definition: "Returns a new array that is a copy of the original array, removing any items that also appear in other_ary. The order is preserved from the original array.",
 object_type: "array",
 example: '<pre class="ruby">[ <span class="ruby-value">1</span>, <span class="ruby-value">1</span>, <span class="ruby-value">2</span>, <span class="ruby-value">2</span>, <span class="ruby-value">3</span>, <span class="ruby-value">3</span>, <span class="ruby-value">4</span>, <span class="ruby-value">5</span> ] <span class="ruby-operator">-</span> [ <span class="ruby-value">1</span>, <span class="ruby-value">2</span>, <span class="ruby-value">4</span> ]  <span class="ruby-comment">#=&gt;  [ 3, 3, 5 ]</span>
</pre>',
 return_type: "new array")

Card.create!(term: "compact",
 definition: "Returns a copy of self with all nil elements removed.",
 object_type: "array",
 example: '<pre class="ruby">[ <span class="ruby-string">"a"</span>, <span class="ruby-keyword">nil</span>, <span class="ruby-string">"b"</span>, <span class="ruby-keyword">nil</span>, <span class="ruby-string">"c"</span>, <span class="ruby-keyword">nil</span> ].<span class="ruby-identifier">compact</span>
                  <span class="ruby-comment">#=&gt; [ "a", "b", "c" ]</span>
</pre>',
 return_type: "new array")

Card.create!(term: "exist?",
 definition: "Return true if the named file exists.",
 object_type: "File",
 example: "nil",
 return_type: "boolean")

Card.create!(term: "collect",
 definition: "Returns a new array with the results of running block once for every element in enum.  If no block is given, an enumerator is returned instead.",
 object_type: "Enumerable",
 example: '<span class="ruby-comment">#=&gt; ["cat", "cat", "cat", "cat"]</span>',
 return_type: "array")

Card.create!(term: "append",
 definition: "Concatenates the given object to str. If the object is a Integer, it is considered as a codepoint, and is converted to a character before concatenation.",
 object_type: "String",
 example: '<pre class="ruby"><span class="ruby-identifier">a</span> = <span class="ruby-string">"hello "</span>
<span class="ruby-identifier">a</span> <span class="ruby-operator">&lt;&lt;</span> <span class="ruby-string">"world"</span>   <span class="ruby-comment">#=&gt; "hello world"</span>
<span class="ruby-identifier">a</span>.<span class="ruby-identifier">concat</span>(<span class="ruby-value">33</span>)   <span class="ruby-comment">#=&gt; "hello world!"</span>
</pre>',
 return_type: "string")

