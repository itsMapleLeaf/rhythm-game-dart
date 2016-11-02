import 'color.dart';
import 'graphics.dart';

class NoteField {
  num leftOffset;
  num columnWidth;
  int columnCount;
  List<Color> columnColors;

  get totalWidth => columnWidth * columnCount;

  draw() {
    final ctx = canvas.context2D;
    final coverColor = Color.black;
    drawCover(coverColor);

    layer(() {
      for (int i = 0; i < columnCount; i++) {
        drawBacklight(columnColors[i]);
        drawKey(columnColors[i]);
        drawReceptor(columnColors[i]);
        ctx.translate(columnWidth, 0);
      }
    });
  }

  drawCover(Color color) {
    drawRectangle(0, 0, totalWidth, canvas.height, color.withOpacity(0.8));
  }

  drawBacklight(Color color) {
    drawRectangle(0, 0, columnWidth, canvas.height, color.withOpacity(0.08));
  }

  drawKey(Color color) {
    drawRectangle(0, canvas.height, columnWidth, -100, color);
  }

  drawReceptor(Color color) {
    color = color.withOpacity(0.3);
    drawRectangle(0, canvas.height - 100, columnWidth, -24, color);
  }
}
