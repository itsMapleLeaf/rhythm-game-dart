import 'dart:html';

import 'color.dart';

final noteHeight = 24;

class Note {
  final num time;
  final num column;

  Note(this.time, this.column);

  draw(num x, num y, num width, Color color) {
    final CanvasElement canvas = querySelector('#game');
    canvas.context2D
      ..fillStyle = color
      ..fillRect(x, y, width, -noteHeight);
  }
}
