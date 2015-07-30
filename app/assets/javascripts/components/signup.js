$( document ).ready(function() {

  $('.error').hide();

  function isValidFullName(fullName) {
    var validate_name = new RegExp (/^[a-zA-Z ]+$/);
    return validate_name.test(fullName);
  }

  function isValidPassword(password) {
    var validate_password = new RegExp (/^[^\s]+$/);
    return validate_password.test(password);
  }

  function isValidEmailAddress(emailAddress) {

    var pattern = new RegExp(/[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)\b/i);

    return pattern.test(emailAddress);
  }

  $(".signup").submit(function(event) {

  var errorMessage = "";

  if (!isValidFullName($(".full-name").val())) {
    errorMessage += "*Please enter your full name<br>";
  }

  if (!isValidEmailAddress($(".email").val())) {
   errorMessage += "*Please enter a valid email address<br>";
  }

  if ($(".password").val().length < 8 || !isValidPassword($(".password").val())) {
    errorMessage += "*Password must be at least 8 characters long and have no spaces<br>";
  }

  if (errorMessage==="") {
    return true;
  } else {
      event.preventDefault();
      $('.error').show();
      $(".error").html(errorMessage);
  }

  });

});
