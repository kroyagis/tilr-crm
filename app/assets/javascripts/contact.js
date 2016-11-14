$(function(){

  // clicking on each contact activates and deactivates active class
  $(document).on('click', '.clickable-row', function(){
    $('.clickable-row.active').removeClass('active');
    $(this).addClass('active');
    $.getScript($(this).data("href"));
    return false;
  });

  // sort link triggers AJAX request
  $(document).on('click', '#contacts-list th a', function(){
    $.getScript(this.href);
    return false;
  });

  // live search without... use jQuery plugin instead for production
  $("#contact-search input").keyup(function() {
    $.get($("#contact-search").attr("action"), $("#contact-search").serialize(), null, "script");
    return false;
  });
  
});
