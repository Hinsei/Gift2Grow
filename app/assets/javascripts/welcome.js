$(document).on('turbolinks:load',function() {
  setTimeout(function() {
    $('.ribbon').addClass('active');
  }, 500);
});