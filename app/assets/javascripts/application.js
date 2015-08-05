// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree
$(document).ready(function() {
  $('ul .tabs').each(function() {
    var $active, $content, $links = $(this).find('a');

    $active = $($links.filter('[href="' +location.hash+'"]')[0] || $links[0]);
    $active.addClass('selectedTab');

    $content = $($active[0].hash);

    $links.not($active).each(function() {
      $(this.hash).hide();
    });

    $(this).on('click', 'a', function(e) {
      $active.removeClass('selectedTab');
      $content.hide();

      $active = $(this);
      $content = $(this.hash);

      $active.addClass('selectedTab');
      $content.show();

      e.preventDefault();
    });

  });

})
