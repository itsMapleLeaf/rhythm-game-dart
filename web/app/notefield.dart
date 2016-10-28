import 'dart:html';

import 'color.dart';
import 'note.dart';

const num columnCount = 6;
const num keyHeight = 100;
const num leftOffset = 220;
const num noteHeight = 24;
const num noteSpacing = 200;
const num receptorHeight = 24;

final Color backgroundColor = Black.opacity(0.8);
final Color borderColor = White.opacity(0.8);
final List<Color> columnColors = [Yellow, White, Violet, White, Violet, White];
final List<num> columnWidths = [50, 48, 46, 48, 46, 48];
final num totalWidth = columnWidths.reduce((a, b) => a + b);

class Column {
  final CanvasElement canvas;
  final Color color;
  final num left;
  final num width;

  Column(this.canvas, this.left, this.width, this.color);

  drawBacklight() {
    canvas.context2D
      ..fillStyle = color.opacity(0.05)
      ..fillRect(left, 0, width, canvas.height);
  }

  drawReceptor() {
    canvas.context2D
      ..fillStyle = color.opacity(0.3)
      ..fillRect(left, canvas.height - keyHeight, width, -receptorHeight);
  }

  drawKey() {
    canvas.context2D
      ..fillStyle = color
      ..fillRect(left, canvas.height, width, -keyHeight);
  }
}

class Notefield {
  final List<Column> columns = [];
  final CanvasElement canvas;

  Notefield(this.canvas) {
    num left = leftOffset;
    for (num i = 0; i < columnCount; i++) {
      final width = columnWidths[i];
      final color = columnColors[i];
      columns.add(new Column(canvas, left, width, color));
      left += width;
    }
  }

  drawBackground() {
    canvas.context2D
      ..fillStyle = backgroundColor
      ..fillRect(leftOffset, 0, totalWidth, canvas.height);
  }

  drawBorders() {
    canvas.context2D
      ..fillStyle = borderColor
      ..fillRect(leftOffset - 4, 0, 4, canvas.height)
      ..fillRect(leftOffset + totalWidth, 0, 4, canvas.height);
  }

  drawNotes(List<Note> notes, num songTime) {
    for (final note in notes) {
      final time = note.time;
      final col = note.column;
      final x = columns[col].left;
      final y = canvas.height - keyHeight - time * noteSpacing + songTime * noteSpacing;
      final width = columns[col].width;
      final color = columns[col].color;
      note.draw(canvas, x, y, width, color);
    }
  }

  draw(List<Note> notes, num songTime) {
    drawBackground();
    drawBorders();
    columns.forEach((col) => col.drawBacklight());
    columns.forEach((col) => col.drawReceptor());
    drawNotes(notes, songTime);
    columns.forEach((col) => col.drawKey());
  }
}