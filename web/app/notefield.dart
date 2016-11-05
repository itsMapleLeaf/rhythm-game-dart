import 'graphics.dart';
import 'song.dart';
import 'util.dart';

class NoteFieldColumn {
  static const width = 48;
  static const keyHeight = 100;
  static const noteHeight = 24;
  static const noteSpacing = 300;

  bool pressed = false;
  num brightness = 0;
  final Color color;

  NoteFieldColumn(this.color);

  drawBacklight() {
    drawRectangle(0, 0, width, canvas.height, color.withOpacity(0.08));
  }

  drawKey() {
    drawRectangle(0, canvas.height, width, -keyHeight, color);
  }

  drawReceptor() {
    final color = this.color.withOpacity(0.3);
    drawRectangle(0, canvas.height - keyHeight, width, -noteHeight, color);
  }

  drawNote(Note note) {
    final x = note.column * width;
    final y = note.time * noteSpacing;
    drawRectangle(x, -y, width, -noteHeight, color);
    drawRectangle(x, -y, width, -(noteSpacing * note.length + noteHeight), color.withOpacity(0.5));
  }
}

class NoteField {
  static const leftOffset = 250;

  static final columnColors = [
    Color.yellow,
    Color.white,
    Color.violet,
    Color.white,
    Color.violet,
    Color.white,
  ];

  static final columns = columnColors
    .map((color) => new NoteFieldColumn(color))
    .toList();

  static get totalWidth => NoteFieldColumn.width * columns.length;
  static get centerX => leftOffset + totalWidth / 2;

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
          column.drawBacklight();
          column.drawReceptor();
          ctx.translate(NoteFieldColumn.width, 0);
        }
      });

      layer(() {
        ctx.translate(0, canvas.height - NoteFieldColumn.keyHeight);
        ctx.translate(0, song.time * NoteFieldColumn.noteSpacing);
        for (final note in song.notes) {
          if (note.state != NoteState.hit) {
            columns[note.column].drawNote(note);
          }
        }
      });

      layer(() {
        for (final column in columns) {
          column.drawKey();
          ctx.translate(NoteFieldColumn.width, 0);
        }
      });

      drawEdges();
    });
  }

  drawCover(Color color) {
    drawRectangle(0, 0, totalWidth, canvas.height, color.withOpacity(0.8));
  }

  drawEdges() {
    final color = Color.white.withOpacity(0.8);
    layer(() {
      drawRectangle(0, 0, -4, canvas.height, color);
      drawRectangle(totalWidth, 0, 4, canvas.height, color);
    });
  }
}
