import 'dart:html';

import 'color.dart';
import 'column.dart';

class Note {
  static const noteSpacing = 200;
  static const noteHeight = 24;

  final num time;
  final num column;

  Note(this.time, this.column);

  draw(Column column, num songTime) {
    final CanvasElement canvas = querySelector('#game');
    final num x = column.left;
    final num y = canvas.height - Column.keyHeight - time * noteSpacing + songTime * noteSpacing;
    final num width = column.width;
    final Color color = column.color;

    canvas.context2D
      ..fillStyle = color
      ..fillRect(x, y, width, -noteHeight);
  }
}
