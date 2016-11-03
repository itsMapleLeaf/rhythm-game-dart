import 'dart:html' show KeyboardEvent, KeyCode;

import 'game.dart';
import 'graphics.dart';

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

  keydown(KeyboardEvent event) {
    if (event.keyCode == KeyCode.UP) {
      currentSong -= 1;
    } else if (event.keyCode == KeyCode.DOWN) {
      currentSong += 1;
    }
    currentSong = currentSong % songs.length;
  }

  keyup(KeyboardEvent event) {}

  update(num dt) {}

  draw() {
    num pos = canvas.height / 2 - 126 * currentSong;
    for (final song in songs) {
      drawText(song['title'], 20, pos, Color.asphalt, Font.roboto(72));
      drawText(song['artist'], 20, pos + 50, Color.asphalt, Font.roboto(54));
      pos += 126;
    }
  }
}