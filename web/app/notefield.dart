import 'graphics.dart';
import 'song.dart';
import 'util.dart';

class NoteFieldColumn {
  bool pressed = false;
  num brightness = 0;
  final Color color;

  NoteFieldColumn(this.color);
}

class NoteField {
  static const columnWidth = 48;
  static const keyHeight = 100;
  static const leftOffset = 250;
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

  static final columns = columnColors.map((color) => new NoteFieldColumn(color));

  static get totalWidth => columnWidth * columns.length;

  update(num dt) {
    for (final col in columns) {
      if (col.pressed) {
        col.brightness = 1;
      } else {
        col.brightness = lerp(col.brightness, 0, dt * 20);
      }
    }
  }

  draw(Song song) {
    final ctx = canvas.context2D;
    final coverColor = Color.black;

    layer(() {
      canvas.context2D.translate(leftOffset, 0);
      drawCover(coverColor);

      layer(() {
        for (final column in columns) {
          drawBacklight(column.color);
          drawReceptor(column.color);
          ctx.translate(columnWidth, 0);
        }
      });

      layer(() {
        ctx.translate(0, canvas.height - keyHeight);
        ctx.translate(0, song.time * noteSpacing);
        for (final note in song.notes) {
          drawNote(note);
        }
      });

      layer(() {
        for (final column in columns) {
          drawKey(column.color);
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
    final color = columns[note.column].color;
    drawRectangle(x, -y, columnWidth, -noteHeight, color);
  }
}
