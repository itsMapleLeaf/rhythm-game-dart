import 'dart:html' show KeyboardEvent;

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

  keydown(KeyboardEvent event) {}
  keyup(KeyboardEvent event) {}

  update(num dt) {}

  draw() {
    num pos = 70;
    for (final song in songs) {
      drawText(song['title'], 20, pos, Color.asphalt, Font.roboto(72));
      drawText(song['artist'], 20, pos + 50, Color.asphalt, Font.roboto(54));
      pos += 126;
    }
  }
}