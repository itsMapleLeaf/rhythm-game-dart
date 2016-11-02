import 'dart:html' show querySelector, CanvasElement, window;

import 'color.dart' show Color;
import 'notefield.dart' show drawNotefield;
import 'graphics.dart' show clear;

/// Model representing the game's state
class GameModel {}

main() async {
  final CanvasElement canvas = querySelector('#game');
  final ctx = canvas.context2D;

  while (true) {
    await window.animationFrame;

    ctx.resetTransform();
    clear(canvas, Color.white);

    ctx..save()..translate(250, 0);

    drawNotefield(canvas, 48, 6, [
      Color.yellow,
      Color.white,
      Color.violet,
      Color.white,
      Color.violet,
      Color.white,
    ]);

    ctx.restore();
  }
}