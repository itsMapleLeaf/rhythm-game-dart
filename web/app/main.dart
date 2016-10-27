import 'dart:html';

import 'game.dart';

main() async {
  final CanvasElement canvas = querySelector('#game');
  final game = new Game(canvas);
  num time = new DateTime.now().millisecondsSinceEpoch;

  frame(now) {
    final elapsed = now - time;
    game.update(elapsed / 1000);
    game.draw();
    time = now;
    window.requestAnimationFrame(frame);
  }

  window.requestAnimationFrame(frame);
}