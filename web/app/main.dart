import 'dart:html';

import 'game.dart';

main() async {
  final game = new Game();

  window.onKeyDown.forEach(game.keydown);
  window.onKeyUp.forEach(game.keyup);

  num time = await window.animationFrame;
  while (true) {
    final now = await window.animationFrame;
    final elapsed = now - time;
    time = now;
    game.update(elapsed / 1000);
    game.draw();
  }
}