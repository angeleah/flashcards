(function(d) {
  var s = d.createElement('script');
  s.setAttribute('id', 'ruby-parser-script');
  s.setAttribute('type','text/javascript');
  s.setAttribute('charset','UTF-8');
  s.setAttribute('src','/assets/rubydoc_parser.js');
  var existingScript = document.getElementById('ruby-parser-script');
  if (!existingScript) {
    d.body.appendChild(s);
  } else {
    existingScript.remove();
    d.body.appendChild(s);
  }
})(document);
