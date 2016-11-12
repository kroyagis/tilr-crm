$(function(){
  $(document).on('click', '.list-group-item', function(e){
    $('div.list-group a.active').removeClass('active');
    $(this).addClass('active');
  });
  // // sends out ajax request
  // $(document).on('click', '.contact-wrapper > a, #create-button > a, #edit-button', function(eventObject){
  //   console.log("hello");
  //   eventObject.preventDefault();
  //   $.ajax({
  //     url: $(this).attr('href'),
  //     method: 'GET',
  //     data: {},
  //     dataType: 'html'
  //   }).done(function(responseData){
  //     console.log(responseData);
  //     $('.contact-detail').html(responseData);
  //   }).fail(function(){
  //     console.log("Something went wrong");
  //   });
  // });
  // $(document).on('submit','.new_contact, .edit_contact', function(eventObject){
  //   console.log("form submitted");
  //   eventObject.preventDefault();
  //   $.ajax({
  //     url: $(this).attr('action'),
  //     method: $(this).attr('method'),
  //     data: $(this).serialize(),
  //     dataType: 'html'
  //   }).done(function(responseData){
  //     console.log(responseData);
  //     $('.contact-detail').html(responseData);
  //   }).fail(function(){
  //     console.log("Something went wrong");
  //   });
  // });
});
