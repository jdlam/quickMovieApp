$(document).ready(function(){
  formValidation();
  bindSubmit();
});

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

function formValidation() {
  $('#title').on('keyup', function(){
    if ($('#title').val().length > 0) {
      $('input[type=submit]').prop('disabled',false)
    } else {
      $('input[type=submit]').prop('disabled',true)
    }
  });
}
