// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require jquery
//= require jquery_ujs
$(function () {

  $('.slideshow').each(function () {

    var $slides = $(this).find('img'),
      slideCount = $slides.length,
      currentIndex = 0;

    $slides.eq(currentIndex).fadeIn();
    setInterval(showNextSlide, 5000);

    function showNextSlide() {
      var nextIndex = (currentIndex + 1) % slideCount;
      $slides.eq(currentIndex).fadeOut();
      $slides.eq(nextIndex).fadeIn();
      currentIndex = nextIndex;
    }

  });
}); 
