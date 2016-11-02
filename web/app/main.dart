import 'dart:html' show querySelector, CanvasElement, window;

import 'color.dart' show Color;
import 'notefield.dart' show drawNotefield;
import 'graphics.dart' show clear, reset, layer;

/// Model representing the game's state
class GameModel {}

main() async {
  final CanvasElement canvas = querySelector('#game');

  while (true) {
    await window.animationFrame;

    reset(canvas);
    clear(canvas, Color.white);
    layer(canvas, () {
      canvas.context2D.translate(250, 0);
      drawNotefield(canvas, 48, 6, [
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