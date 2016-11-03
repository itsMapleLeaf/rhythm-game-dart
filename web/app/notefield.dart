import 'graphics.dart';
import 'note.dart';

class NoteField {
  static const leftOffset = 250;
  static const columnWidth = 48;
  static const columnCount = 6;

  static const keyHeight = 100;
  static const noteHeight = 24;
  static const noteSpacing = 300;

  static final columnColors = [
    Color.yellow,
    Color.white,
    Color.violet,
    Color.white,
    Color.violet,
    Color.white,
  ];

  get totalWidth => columnWidth * columnCount;

  draw(List<Note> notes, num songTime) {
    final ctx = canvas.context2D;
    final coverColor = Color.black;

    layer(() {
      canvas.context2D.translate(leftOffset, 0);
      drawCover(coverColor);

      layer(() {
        for (int i = 0; i < columnCount; i++) {
          drawBacklight(columnColors[i]);
          drawReceptor(columnColors[i]);
          ctx.translate(columnWidth, 0);
        }
      });

      layer(() {
        ctx.translate(0, canvas.height - keyHeight);
        ctx.translate(0, songTime * noteSpacing);
        for (final note in notes) {
          drawNote(note);
        }
      });

      layer(() {
        for (int i = 0; i < columnCount; i++) {
          drawKey(columnColors[i]);
          ctx.translate(columnWidth, 0);
        }
      });

      drawEdges();
    });
  }

  drawCover(Color color) {
    drawRectangle(0, 0, totalWidth, canvas.height, color.withOpacity(0.8));
  }

  drawBacklight(Color color) {
    drawRectangle(0, 0, columnWidth, canvas.height, color.withOpacity(0.08));
  }

  drawKey(Color color) {
    drawRectangle(0, canvas.height, columnWidth, -keyHeight, color);
  }

  drawReceptor(Color color) {
    color = color.withOpacity(0.3);
    drawRectangle(0, canvas.height - keyHeight, columnWidth, -noteHeight, color);
  }

  drawEdges() {
    final color = Color.white.withOpacity(0.8);
    layer(() {
      drawRectangle(0, 0, -4, canvas.height, color);
      drawRectangle(totalWidth, 0, 4, canvas.height, color);
    });
  }

  drawNote(Note note) {
    final x = note.column * columnWidth;
    final y = note.time * noteSpacing;
    final color = columnColors[note.column];
    drawRectangle(x, -y, columnWidth, -noteHeight, color);
  }
}
