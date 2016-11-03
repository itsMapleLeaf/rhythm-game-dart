import 'dart:html';

import 'bg_animation.dart';
import 'notefield.dart';
import 'song.dart';

class Gameplay {
  final bg = new BGAnimation();
  final notefield = new NoteField();
  final song = new Song();

  final keybinds = [
    KeyCode.A,
    KeyCode.S,
    KeyCode.D,
    KeyCode.K,
    KeyCode.L,
    KeyCode.SEMICOLON,
  ];

  keydown(KeyboardEvent event) {
    final index = keybinds.indexOf(event.keyCode);
    if (index > -1) {
      final notes = song.notes
        .where((note) => note.column == index)
        .where((note) => note.state == NoteState.active)
        .where((note) => (song.time - note.time).abs() < 0.1);

      if (notes.isNotEmpty) {
        notes.first.state = NoteState.hit;
      }
    }
  }

  keyup(KeyboardEvent event) {}

  update(num dt) {
    song.update(dt);
    bg.update(dt);
    notefield.update(dt);
  }

  draw() {
    bg.draw();
    notefield.draw(song);
  }
}