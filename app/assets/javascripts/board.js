$(function(){

  $('#board table tr').on('mouseover', 'td', function(e){
    var colClass = $(e.target).attr('class');
    $('.' + colClass).addClass('highlight');
  });

  $('#board table tr').on('mouseout', 'td', function(e){
    $('#board td').removeClass('highlight');
  });

});
