import 'dart:html';

import 'color.dart';

final noteHeight = 24;

class Note {
  final num time;
  final num column;

  Note(this.time, this.column);

  draw(CanvasElement canvas, num x, num y, num width, Color color) {
    canvas.context2D
      ..fillStyle = color
      ..fillRect(x, y, width, -noteHeight);
  }
}
