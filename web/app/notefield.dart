import 'color.dart';
import 'graphics.dart';

/// Draws the notefield
drawNotefield(
  num columnWidth,
  int columnCount,
  List<Color> columnColors,
) {
  final ctx = canvas.context2D;
  final totalWidth = columnWidth * columnCount;
  final coverColor = Color.black;
  drawCover(totalWidth, coverColor);

  layer(() {
    for (int i = 0; i < columnCount; i++) {
      drawBacklight(columnWidth, columnColors[i]);
      drawKey(columnWidth, columnColors[i]);
      drawReceptor(columnWidth, columnColors[i]);
      ctx.translate(columnWidth, 0);
    }
  });
}

drawCover(num width, Color color) {
  drawRectangle(0, 0, width, canvas.height, color.withOpacity(0.8));
}

drawBacklight(num width, Color color) {
  drawRectangle(0, 0, width, canvas.height, color.withOpacity(0.08));
}

drawKey(num width, Color color) {
  drawRectangle(0, canvas.height, width, -100, color);
}

drawReceptor(num width, Color color) {
  color = color.withOpacity(0.3);
  drawRectangle(0, canvas.height - 100, width, -24, color);
}
