import 'dart:html';

import 'game.dart';

main() {
  final game = new Game();
  num time = 0;

  frame(final num now) {
    final elapsed = now - time;
    time = now;
    game.update(elapsed / 1000);
    game.draw();
    window.requestAnimationFrame(frame);
  }

  window.requestAnimationFrame(frame);
  window.onKeyDown.listen(game.keydown);
  window.onKeyUp.listen(game.keyup);
}