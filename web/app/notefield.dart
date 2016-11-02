import 'dart:html' show CanvasElement;

import 'color.dart' show Color;
import 'graphics.dart' show layer, drawRectangle;

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
  drawCover(canvas, totalWidth, coverColor);

  layer(canvas, () {
    for (int i = 0; i < columnCount; i++) {
      drawBacklight(canvas, columnWidth, columnColors[i]);
      drawKey(canvas, columnWidth, columnColors[i]);
      drawReceptor(canvas, columnWidth, columnColors[i]);
      ctx.translate(columnWidth, 0);
    }
  });
}

drawCover(CanvasElement canvas, num width, Color color) {
  drawRectangle(canvas, 0, 0, width, canvas.height, color.withOpacity(0.8));
}

drawBacklight(CanvasElement canvas, num width, Color color) {
  drawRectangle(canvas, 0, 0, width, canvas.height, color.withOpacity(0.08));
}

drawKey(CanvasElement canvas, num width, Color color) {
  drawRectangle(canvas, 0, canvas.height, width, -100, color);
}

drawReceptor(CanvasElement canvas, num width, Color color) {
  color = color.withOpacity(0.3);
  drawRectangle(canvas, 0, canvas.height - 100, width, -24, color);
}
