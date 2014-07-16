$(function(){

  $('#board table tr').on('mouseover', 'td', function(e){
    var colClass = $(e.target).attr('class');
    $('.' + colClass).addClass('highlight');
  });

  $('#board table tr').on('mouseout', 'td', function(e){
    $('#board td').removeClass('highlight');
  });

  $('#board table tr').on('click', 'td', function(e){
    var cell = $(e.target);
    var gameId = cell.data('game-id');
    var currentColumn = cell.data('y');

    $.post('/games/' + gameId + '/movements', { movement: { y_position: currentColumn } })
      .done(function(data) {
        console.log(data);
      })
      .fail(function(){
        alert('Invalid movement');
      });
  });
});
