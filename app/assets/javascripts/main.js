$(function (){

  var $profiles = $('#orders');

  $.ajax({
    type: 'GET',
    url: '/orders',
    success: function(profiles) {
      $.each(profiles, function(i, profile) {
        $profiles.append('<li>Name: ' + profile.name + '</li>');
      });
    }
  });
});
