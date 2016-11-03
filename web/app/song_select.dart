import 'dart:html' show KeyboardEvent, KeyCode;
// import 'dart:math' show PI;

import 'game.dart';
import 'graphics.dart';
import 'util.dart';

class SongWheel {
  List songs;
  int currentSong = 0;
  num visualOffset = 0;

  SongWheel(this.songs);

  selectNext() {
    visualOffset = 100;
    currentSong = (currentSong + 1) % songs.length;
  }

  selectPrevious() {
    visualOffset = -100;
    currentSong = (currentSong - 1) % songs.length;
  }

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

  num visualOffset = 0;

  SongWheel wheel;

  SongSelect() {
    wheel = new SongWheel(songs);
  }

  keydown(KeyboardEvent event) {
    if (event.keyCode == KeyCode.UP) {
      wheel.selectPrevious();
    } else if (event.keyCode == KeyCode.DOWN) {
      wheel.selectNext();
    }
  }

  keyup(KeyboardEvent event) {}

  update(num dt) {
    wheel.update(dt);
  }

  draw() {
    wheel.draw();
  }
}