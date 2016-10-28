import 'dart:html';

import 'bg_animation.dart';
import 'notefield.dart';
import 'note.dart';

class Game {
  static final List<KeyCode> keybinds = [
    KeyCode.A,
    KeyCode.S,
    KeyCode.D,
    KeyCode.K,
    KeyCode.L,
    KeyCode.SEMICOLON,
  ];

  final List<Note> notes = [];

  num songTime = -3;
  BackgroundAnimation bg;
  Notefield notefield;


  Game() {
    bg = new BackgroundAnimation();
    notefield = new Notefield();

    notes.add(new Note(0 / 2, 0));
    notes.add(new Note(1 / 2, 0));
    notes.add(new Note(2 / 2, 0));
    notes.add(new Note(3 / 2, 0));
    notes.add(new Note(4 / 2, 0));
    notes.add(new Note(5 / 2, 0));
  }

  update(num dt) {
    songTime += dt;
    bg.update(dt);
  }

  keydown(KeyboardEvent event) {
    for (final note in notes) {
      if (note.state == NoteState.active
      && event.keyCode == keybinds[note.column]
      && (note.time - songTime).abs() < 0.1) {
        note.state = NoteState.hit;
        break;
      }
    }
  }

  keyup(KeyboardEvent event) {}

  draw() {
    final CanvasElement canvas = querySelector('#game');

    canvas.context2D
      ..fillStyle = 'white'
      ..fillRect(0, 0, canvas.width, canvas.height);

    bg.draw();
    notefield.draw(notes, songTime);
  }
}