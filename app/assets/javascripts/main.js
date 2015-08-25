$(function (){

  var $profiles = $('#orders');
  var $name = $('#name');
  var $drink = $('#drink');

  $.ajax({
    type: 'GET',
    url: '/orders',
    success: function(profiles) {
      $.each(profiles, function(i, profile) {
        $profiles.append('<li>Name: ' + profile.name + '</li>');
      });
    },
    error: function() {
      alert('error loading profile')
    }
  });

  $('#add-order').on('click',function(){
    var order = {
      name: $name.val(),
    };
    $.ajax({
      type: 'POST',
      url: '/orders',
      data: order,//order,
      success: function(profiles) {
        $profiles.append('<li>Name: ' + profiles.name + '</li>');
      },
      error: function() {
        alert('error saving order'+order.name);
      }
    });
    //$.ajax({
    //  type: 'GET',
    //  url: '/orders',
    //  success: function(profiles) {
    //    $.each(profiles, function(i, profile) {
    //      $profiles.append('<li>Name: ' + profile.name + '</li>');
    //    });
    //  },
    //  error: function() {
    //    alert('error loading profile')
    //  }
    //});
  });
});
