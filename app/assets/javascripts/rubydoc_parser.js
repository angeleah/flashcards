var script = document.createElement("script");
script.src = "//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.6.0/underscore-min.js";
script.onload = function() {

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
      return_type: getReturnType(methodDetail)
    };
    methods.push(details);
   });

  displayMethods();

  function reset() {
    $("main").show();
    $(".example-container").hide();
    $(".nav-section").show();
  }

  function sendMethods() {
    alert("do it");
  }

  function displayMethods() {
    $(".nav-section").hide();
    var main = $("main");
    main.hide();
    var exampleContainer = $('<div class="example-container" />');
    exampleContainer.append("<h1>" + objectType + "</h1>");
    exampleContainer.css("padding", "5em");
    methods.forEach(function(method) {
      var example = $('<div class="example" />');
      example.append("<h2>" + _(method.terms_attributes).map(function(ta) { return ta.term; }) + "</h2>");
      example.append("<p>" + method.definition + "</p>");
      example.append("<p>Returns: " + method.return_type + "</p>");
      example.append('<div class="method-example">' + method.example + '</div>');
      exampleContainer.append(example);
    });


    exampleContainer.append('<button id="doit">Do It</button><br /><button id="nope">Nope</button>');

    // $("#doit").on("click", sendMethods);
    // $("#nope").on("click", reset);

    main.after(exampleContainer);
  }

  function getReturnType(methodDetail) {
    return_types = [];
    var spans = methodDetail.find(".method-callseq");
    if (spans.length) {
      spans.each(function() {
        var text = $(this).text();
        var parts = text.split('→');
        if (parts.length > 1) {
         var return_type = parts[1].trim();
        }
        if (return_type) {
          return_types.push(return_type);
        }
      });
    }
    if (!return_types.length) {
      var paragraph = methodDetail.find(".method-description > p:first");
      if (paragraph.text().match(/Returns\sa\s((new)?\s?\w+)/)) {
        return_types.push(paragraph.text().match(/Returns\sa\s((new)?\s?\w+)/)[1]);
      }
    };
    return _(return_types).uniq().join(', ');
  }

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
};
document.getElementsByTagName("head")[0].appendChild(script);
