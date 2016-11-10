$(function(){
  // sends out ajax request
  $(document).on('click', '.contact-wrapper > a, #create-button > a', function(eventObject){
    console.log("hello");
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
});
