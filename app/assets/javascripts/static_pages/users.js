$(document).ready(function() {

  //Direct user to specified project page
  $('.user-project').on('click', function() {
    var url = $('.user-project-summary').find('a').attr('href');
    location.href = url;
  });

});
