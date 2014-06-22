var urlParts = location.href.split('/');
var objectType = urlParts[urlParts.length - 1].replace(/\.html$/, '');
var instanceMethods = [];
var classMethods = [];

$("#method-list-section .link-list li a").each(function() {
  var methodLink = $(this);
  var methodDetail = $(methodLink.attr("href"));
  var details = {
    category: "Ruby",
    object_type: objectType,
    terms_attributes: [{ term: methodLink.text().replace(/^(#|::)/, "") }],
    definition: getDefinition($(methodDetail))
  };
  console.log(details);
  // if (isClassMethod()) {

  // } else {

  // }
});

function getDefinition(elem) {
  var definition = "";
  var paragraphs = elem.find(".method-description > p");
  if (elem.hasClass("method-alias")) {
    definition += elem.find(".aliases").text().replace(/^\s+(Alias\sfor\:\s\w+)\s+$/, "$1");
  }
  paragraphs.each(function() {
    var paragraph = $(this).html();
    if (paragraphs.length === 1 || paragraph.split(/\s/).length > 3) {
      definition += paragraph;
    }
  });
  definition =   definition.replace(/^.+—\s?/, '');
  return definition;
}
function isClassMethod() {
  return !!$(this).attr("id").match(/^method-c/);
}


// let(:card_attributes) do
//   {
//     terms_attributes: [
//       { term: "-"},
//       { term: "array difference"}
//       ],
//     definition: "Hello",
//     object_type: "Array",
//     example: 'hello',
//     return_type: "new Array",
//     category: "Ruby"
//   }
// end



// <div id="method-i-26" class="method-detail ">


//         <div class="method-heading">
//           <span class="method-callseq">
//             ary &amp; other_ary      → new_ary
//           </span>

//           <span class="method-click-advice">click to toggle source</span>

//         </div>



//         <div class="method-description">

//           <p><a href="Set.html">Set</a> Intersection — Returns a new array containing
// elements common to the two arrays, excluding any duplicates. The order is
// preserved from the original array.</p>

// <p>It compares elements using their <a href="Array.html#method-i-hash">hash</a> and <a href="Array.html#method-i-eql-3F">eql?</a> methods for efficiency.</p>

// <pre class="ruby">[ <span class="ruby-value">1</span>, <span class="ruby-value">1</span>, <span class="ruby-value">3</span>, <span class="ruby-value">5</span> ] <span class="ruby-operator">&amp;</span> [ <span class="ruby-value">1</span>, <span class="ruby-value">2</span>, <span class="ruby-value">3</span> ]                 <span class="ruby-comment">#=&gt; [ 1, 3 ]</span>
// [ <span class="ruby-string">'a'</span>, <span class="ruby-string">'b'</span>, <span class="ruby-string">'b'</span>, <span class="ruby-string">'z'</span> ] <span class="ruby-operator">&amp;</span> [ <span class="ruby-string">'a'</span>, <span class="ruby-string">'b'</span>, <span class="ruby-string">'c'</span> ]   <span class="ruby-comment">#=&gt; [ 'a', 'b' ]</span>
// </pre>

// <p>See also <a href="Array.html#method-i-uniq">#uniq</a>.</p>




//           <div class="method-source-code" id="26-source">
//             <pre>static VALUE
// rb_ary_and(VALUE ary1, VALUE ary2)
// {
//     VALUE hash, ary3, v;
//     st_table *table;
//     st_data_t vv;
//     long i;

//     ary2 = to_ary(ary2);
//     ary3 = rb_ary_new();
//     if (RARRAY_LEN(ary2) == 0) return ary3;
//     hash = ary_make_hash(ary2);
//     table = rb_hash_tbl_raw(hash);

//     for (i=0; i&lt;RARRAY_LEN(ary1); i++) {
//         v = RARRAY_AREF(ary1, i);
//         vv = (st_data_t)v;
//         if (st_delete(table, &amp;vv, 0)) {
//             rb_ary_push(ary3, v);
//         }
//     }
//     ary_recycle_hash(hash);

//     return ary3;
// }</pre>
//           </div>

//         </div>




//       </div>
