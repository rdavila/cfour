$(function(){
  var currentUserColor = $('#board').data('current-user-color')

  $('#board table tr').on('mouseover', 'td', function(e){
    var colClass = $(e.target).attr('class').match(/col\-\d/)[0]

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
        var xPosition = data.x_position;
        var yPosition = data.y_position;
        var cell = $('td.col-' + yPosition + '.row-' + xPosition);

        cell.css('background-color', currentUserColor);
      })
      .fail(function(){
        alert('Invalid movement');
      });
  });
});
