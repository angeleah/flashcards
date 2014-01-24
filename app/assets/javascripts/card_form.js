$(document).ready( function() {

  var term_index = 0;

  function addTerm(event) {
    event.preventDefault();
    term_index = term_index + 1;
    term_text_id = "card_term_attributes_" + term_index + "_term";
    $("#termgroup").append("<input id='" + term_text_id + "' name='card[terms_attributes][" +
                           term_index + "][term]' size='30' type='text'> <input id='remove_term_" +
                             term_index + "' class='remove_term remove' type='button' value='×'/>");
    $("#" + term_text_id).focus();
  }

  function removeTerm() {
    $(this).prev().remove();
    $(this).remove();
  }

  $("#add_term").on("click", addTerm);
  $("#termgroup").on("click", ".remove_term", removeTerm);
});
