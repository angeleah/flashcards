// let(:card_attributes) do
//   {
//     X terms_attributes: [
//       { term: "-"},
//       { term: "array difference"}
//       ],
//     X definition: "Hello",
//     X object_type: "Array",
//     X example: 'hello',
//     return_type: "new Array",
//     X category: "Ruby"
//   }
// end
var urlParts = location.href.split('/');
var objectType = urlParts[urlParts.length - 1].replace(/\.html$/, '');
var methods = [];

$("#method-list-section .link-list li a").each(function() {
  var methodLink = $(this);
  var methodDetail = $(methodLink.attr("href"));
  var details = {
    category: "Ruby",
    object_type: objectType,
    terms_attributes: getTermsAttributes(methodLink, methodDetail),
    definition: getDefinition(methodDetail),
    example: getExample(methodDetail),
  };
  methods.push(details);
  console.log(details);
 });

function getExample(methodDetail) {
  codeBlock = methodDetail.find(".method-description > pre");
  if (codeBlock.length) {
    return "<pre>" + $(codeBlock).html() + "</pre>";
  }
}

function getTermsAttributes(methodLink, methodDetail) {
  terms_attributes = [];
  var paragraphs = methodDetail.find(".method-description > p");
  terms_attributes.push({ term: methodLink.text().replace(/^(#|::)/, "") });
  if ( !methodDetail.hasClass("method-alias") && $(paragraphs[0]).text().match(/—/) ) {
    terms_attributes.push({ term: $(paragraphs[0]).text().split('—')[0].trim() });
  }
  return terms_attributes;
}

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
  definition = definition.replace(/^.+—\s?/, '');
  return definition;
}

function isClassMethod() {
  return !!$(this).attr("id").match(/^method-c/);
}





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
