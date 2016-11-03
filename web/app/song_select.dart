import 'dart:html' show KeyboardEvent, KeyCode;
import 'dart:math' show PI;

import 'game.dart';
import 'graphics.dart';
import 'util.dart';

class SongSelect implements GameState {
  final songs = [
    {'title': 'Random Song Title', 'artist': 'Random Artist'},
    {'title': 'Random Song Title', 'artist': 'Random Artist'},
    {'title': 'Random Song Title', 'artist': 'Random Artist'},
    {'title': 'Random Song Title', 'artist': 'Random Artist'},
    {'title': 'Random Song Title', 'artist': 'Random Artist'},
    {'title': 'Random Song Title', 'artist': 'Random Artist'},
    {'title': 'Random Song Title', 'artist': 'Random Artist'},
  ];

  int currentSong = 0;
  num visualOffset = 0;

  keydown(KeyboardEvent event) {
    if (event.keyCode == KeyCode.UP) {
      currentSong -= 1;
      visualOffset = -100;
    } else if (event.keyCode == KeyCode.DOWN) {
      currentSong += 1;
      visualOffset = 100;
    }
    currentSong = currentSong % songs.length;
  }

  keyup(KeyboardEvent event) {}

  update(num dt) {
    visualOffset = lerp(visualOffset, 0, dt * 20);
  }

  draw() {
    layer(() {
      canvas.context2D
        ..translate(0, canvas.height / 2)
        ..translate(0, -126 * currentSong)
        ..translate(0, visualOffset);

      num pos = 0;
      for (final song in songs) {
        drawText(song['title'], canvas.width / 2, pos, Color.asphalt, Font.roboto(72));
        drawText(song['artist'], canvas.width / 2, pos + 50, Color.asphalt, Font.roboto(54));
        pos += 126;
      }
      drawPolygon(600, 126 * currentSong, 20, 3, Color.asphalt);
    });
  }
}