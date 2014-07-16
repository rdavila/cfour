$(function(){
  var gameBoard = $('#board');
  var currentUserColor = gameBoard.data('current-user-color')
  var currentUserId = gameBoard.data('current-user-id')

  $('table tr', gameBoard).on('mouseover', 'td', function(e){
    var colClass = $(e.target).attr('class').match(/col\-\d/)[0]

    $('.' + colClass).addClass('highlight');
  });

  $('table tr', gameBoard).on('mouseout', 'td', function(e){
    $('td', gameBoard).removeClass('highlight');
  });

  $('table tr', gameBoard).on('click', 'td', function(e){
    var cell = $(e.target);
    var gameId = cell.data('game-id');
    var currentColumn = cell.data('y');

    $.post('/games/' + gameId + '/movements', { movement: { y_position: currentColumn }, user_id: currentUserId })
      .done(function(data) {
        var xPosition = data.x_position;
        var yPosition = data.y_position;
        var cell = $('td.col-' + yPosition + '.row-' + xPosition);

        cell.css('background-color', currentUserColor);
      })
      .fail(function(jqXHR, textStatus){
        var resp = JSON.parse(jqXHR.responseText);
        var errors = '';

        $.each(resp['errors'], function( index, value ) {
          errors += value + "\n";
        });

        alert(errors);
      });
  });
});
