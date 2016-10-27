import 'dart:html';

import 'color.dart';

class Column {
  static final keyHeight = 100;
  static final receptorHeight = 24;

  final CanvasElement canvas;
  final num left;
  final num width;
  final Color color;

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
  static final Color backgroundColor = Black.opacity(0.8);
  static final Color borderColor = White.opacity(0.8);
  static final num columnCount = 6;
  static final num leftOffset = 220;
  static final num noteHeight = 24;
  static final List<num> columnWidths = [50, 48, 46, 48, 46, 48];
  static final List<Color> columnColors = [Yellow, White, Violet, White, Violet, White];
  static final num totalWidth = columnWidths.reduce((a, b) => a + b);

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

  draw() {
    drawBackground();
    drawBorders();
    columns.forEach((col) => col.drawBacklight());
    columns.forEach((col) => col.drawReceptor());
    columns.forEach((col) => col.drawKey());
  }
}