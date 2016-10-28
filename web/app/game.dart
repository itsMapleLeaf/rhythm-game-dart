import 'dart:html';

import 'bg_animation.dart';
import 'notefield.dart';
import 'note.dart';

class Game {
  final List<Note> notes = [];
  num songTime = -3;
  BackgroundAnimation bg;
  Notefield notefield;

  Game() {
    bg = new BackgroundAnimation();
    notefield = new Notefield();

    notes.add(new Note(0 / 2, 0));
    notes.add(new Note(1 / 2, 1));
    notes.add(new Note(2 / 2, 2));
    notes.add(new Note(3 / 2, 3));
    notes.add(new Note(4 / 2, 4));
    notes.add(new Note(5 / 2, 5));
  }

  update(num dt) {
    songTime += dt;
    bg.update(dt);
  }

  keyup(KeyboardEvent event) {}

  keydown(KeyboardEvent event) {}

  draw() {
    final CanvasElement canvas = querySelector('#game');

    canvas.context2D
      ..fillStyle = 'white'
      ..fillRect(0, 0, canvas.width, canvas.height);

    bg.draw();
    notefield.draw(notes, songTime);
  }
}