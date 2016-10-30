import 'dart:html';

import 'color.dart';
import 'column.dart';

enum NoteState { active, holding, hit, missed }

class Note {
  static final CanvasElement canvas = querySelector('#game');
  static const int noteSpacing = 200;
  static const int noteHeight = 24;

  final num time;
  final int column;
  NoteState state = NoteState.active;

  Note(this.time, this.column);

  draw(Column column, num songTime) {
    if (state == NoteState.hit) return;

    final num x = column.left;
    final num y = canvas.height - Column.keyHeight - time * noteSpacing + songTime * noteSpacing;
    final num width = column.width;
    final Color color = column.color;

    canvas.context2D
      ..fillStyle = color
      ..fillRect(x, y, width, -noteHeight);
  }
}
