document.addEventListener('page:change', function(){

  $(".fade_trigger").hover(function() {
    $(this).children('.fade_area').fadeIn();
  }, function() {
    $(this).children('.fade_area').fadeOut();
  });

});
