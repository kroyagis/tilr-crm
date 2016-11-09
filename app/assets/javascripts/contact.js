$(function(){
  // sends out ajax request when contact is clicked
  $('body').on('click', '.contact-wrapper > a', function(eventObject){
    eventObject.preventDefault();
    $.ajax({
      url: $(this).attr('href'),
      method: 'GET',
      data: {},
      dataType: 'html'
    }).done(function(responseData){
      console.log(responseData);
      $('.contact-detail').html(responseData);
    }).fail(function(){
      console.log("Something went wrong");
    });
  });
  // sends out ajax request when nav item is clicked
  $('body').on('click', '.nav-item > a', function(eventObject){
    eventObject.preventDefault();
    $.ajax({
      url: $(this).attr('href'),
      method: 'GET',
      data: {},
      dataType: 'html'
    }).done(function(responseData){
      console.log(responseData);
      $('.list-column').html(responseData);
    }).fail(function(){
      console.log("Something went wrong");
    });
  });
});
