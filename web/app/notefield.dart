import 'dart:html';

import 'color.dart';
import 'graphics.dart';

/// Draws the notefield
drawNotefield(
  CanvasElement canvas,
  num columnWidth,
  int columnCount,
  List<Color> columnColors,
) {
  final ctx = canvas.context2D;
  final totalWidth = columnWidth * columnCount;
  final coverColor = Color.black;
  drawNotefieldCover(canvas, totalWidth, coverColor);

  ctx.save();
  for (int i = 0; i < columnCount; i++) {
    drawNotefieldBacklight(canvas, columnWidth, columnColors[i]);
    ctx.translate(columnWidth, 0);
  }
  ctx.restore();
}

drawNotefieldCover(CanvasElement canvas, num width, Color color) {
  drawRectangle(canvas, 0, 0, width, canvas.height, color.withOpacity(0.8));
}

drawNotefieldBacklight(CanvasElement canvas, num width, Color color) {
  drawRectangle(canvas, 0, 0, width, canvas.height, color.withOpacity(0.08));
}