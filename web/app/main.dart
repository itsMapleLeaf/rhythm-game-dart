import 'dart:html';

import 'color.dart';
import 'notefield.dart';
import 'graphics.dart';

/// Model representing the game's state
class GameModel {}

main() async {
  while (true) {
    await window.animationFrame;

    reset();
    clear(Color.white);
    layer(() {
      canvas.context2D.translate(250, 0);
      drawNotefield(48, 6, [
        Color.yellow,
        Color.white,
        Color.violet,
        Color.white,
        Color.violet,
        Color.white,
      ]);
    });
  }
}