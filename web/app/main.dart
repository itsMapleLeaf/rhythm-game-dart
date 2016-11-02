import 'dart:html';

import 'color.dart';

main() async {
  final CanvasElement canvas = document.getElementById('game');

  while (true) {
    await window.animationFrame;
    clear(canvas);
    drawNotefield(canvas);
  }
}

clear(CanvasElement canvas) {
  canvas.context2D
    ..fillStyle = Color.white
    ..fillRect(0, 0, canvas.width, canvas.height);
}

drawNotefield(CanvasElement canvas) {
  canvas.context2D
    ..fillStyle = Color.asphalt.darkenedBy(0.5).withOpacity(0.8)
    ..fillRect(200, 0, 50 * 6, canvas.height);
}