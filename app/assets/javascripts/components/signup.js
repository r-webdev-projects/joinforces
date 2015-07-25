$( document ).ready(function() {

  $('.error').hide();

  $(".signupForm").submit(function(event) {

  var errorMessage = "";

  event.preventDefault();

  function isValidFullName(fullName) {
    var validate_name = new RegExp (/^[a-zA-Z ]+$/);
    return validate_name.test(fullName);
  }

  function isValidPassword(password) {
    var validate_password = new RegExp (/^[^\s]+$/);
    return validate_password.test(password);
  }

  function isValidEmailAddress(emailAddress) {

    var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);

    return pattern.test(emailAddress);
  }

  if (!isValidFullName($(".full_name").val())) {
    errorMessage += "*Please enter your full name<br>";
  }

  if (!isValidEmailAddress($(".email").val())) {
   errorMessage += "*Please enter a valid email address<br>";
  }

  if ($(".password").val().length < 8 || !isValidPassword($(".password").val())) {
    errorMessage += "*Password must be at least 8 characters long and have no spaces<br>";
  }

  if (errorMessage==="") {
    alert("Success");
  } else {
      $('.error').show();
      $(".error").html(errorMessage);
  }

  });

});
