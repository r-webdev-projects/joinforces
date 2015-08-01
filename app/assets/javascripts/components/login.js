$( document ).ready(function() {

  $('.error').hide();

  function isValidPassword(password) {
    var validate_password = new RegExp (/^[^\s]+$/);
    return validate_password.test(password);
  }

  function isValidEmailAddress(emailAddress) {

    var pattern = new RegExp(/[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)\b/i);

    return pattern.test(emailAddress);
  }

  $(".login").submit(function(event) {

  var errorMessage = "";
  var passValue = $(".password").val();

  if (!isValidEmailAddress($(".email").val())) {
   errorMessage += "*Please enter a valid email address<br>";
  }

  if (passValue.length < 8 || !isValidPassword(passValue)) {
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
