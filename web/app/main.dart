import 'dart:html';

final CanvasElement canvas = document.getElementById('game');

main() {
  canvas.context2D
    ..fillStyle = 'white'
    ..fillRect(0, 0, canvas.width, canvas.height)

    ..fillStyle = 'blue'
    ..fillRect(100, 100, 50, 50)
    ;
}