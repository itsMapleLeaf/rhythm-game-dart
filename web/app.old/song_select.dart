import 'dart:html';

import 'color.dart';
import 'game_state.dart';

class Song {
  String artist, title;
}

class SongSelect implements GameState {
  final CanvasElement canvas = querySelector('#game');
  final List<Song> songs = [];

  SongSelect() {
    songs.add(new Song()..title = 'test title'..artist='test artist');
    songs.add(new Song()..title = 'test title'..artist='test artist');
    songs.add(new Song()..title = 'test title'..artist='test artist');
    songs.add(new Song()..title = 'test title'..artist='test artist');
    songs.add(new Song()..title = 'test title'..artist='test artist');
    songs.add(new Song()..title = 'test title'..artist='test artist');
  }

  update(num dt) {
  }

  keydown(KeyboardEvent event) {}

  keyup(KeyboardEvent event) {}

  draw() {
    num pos = 60;

    for (var song in songs) {
      canvas.context2D
        ..textAlign = 'right'

        ..fillStyle = Color.asphalt
        ..font = '64px Roboto'
        ..fillText(song.title, canvas.width * 0.9, pos)

        ..fillStyle = Color.asphalt.lightenedBy(0.2)
        ..font = '42px Roboto'
        ..fillText(song.artist, canvas.width * 0.9, pos + 40)
        ;

      pos += 110;
    }
  }
}
