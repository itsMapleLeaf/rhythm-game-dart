import 'dart:html' show CanvasElement;

import 'color.dart' show Color;
import 'graphics.dart' show drawRectangle;

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
    drawNotefieldKey(canvas, columnWidth, columnColors[i]);
    drawNotefieldReceptor(canvas, columnWidth, columnColors[i]);
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

drawNotefieldKey(CanvasElement canvas, num width, Color color) {
  drawRectangle(canvas, 0, canvas.height, width, -100, color);
}

drawNotefieldReceptor(CanvasElement canvas, num width, Color color) {
  color = color.withOpacity(0.3);
  drawRectangle(canvas, 0, canvas.height - 100, width, -24, color);
}
