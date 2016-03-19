$(document).ready(bindSubmit);

function bindSubmit() {
  $('#searchMovie').submit(function(){
    checkVal('#year');
    checkVal('#type');
  })
}

function checkVal(id) {
  if ( $(id).val()=='' ) {
    $(id).prop('disabled', true)
  }
}
