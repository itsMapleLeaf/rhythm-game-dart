import 'dart:html';

import 'color.dart';
import 'notefield.dart';
import 'graphics.dart';

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
      Color.orange,
      Color.white,
      Color.violet,
      Color.white,
      Color.violet,
      Color.white,
    ]);

    ctx.restore();
  }
}