import 'dart:html';

import 'game.dart';

main() async {
  final CanvasElement canvas = querySelector('#game');
  final game = new Game(canvas);
  var time = await window.animationFrame;

  while (true) {
    final now = await window.animationFrame;
    final elapsed = now - time;
    game.update(elapsed / 1000);
    game.draw();
    time = now;
  }
}
