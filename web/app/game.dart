import 'dart:html';

import 'bg_animation.dart';
import 'notefield.dart';
import 'note.dart';

enum Judgement { absolute, perfect, great, miss, none }

class TimingWindow {
  static const absolute = 25 / 1000;
  static const perfect = 80 / 1000;
  static const great = 140 / 1000;

  static Judgement judge(num timing) {
    timing = timing.abs();
    if (timing <= absolute) return Judgement.absolute;
    if (timing <= perfect) return Judgement.perfect;
    if (timing <= great) return Judgement.great;
    return Judgement.none;
  }
}

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

  keydown(KeyboardEvent event) {
    for (final note in notes) {
      if (note.state == NoteState.active
      && event.keyCode == keybinds[note.column]) {
        final judgement = TimingWindow.judge(songTime - note.time);
        if (judgement != Judgement.none) {
          note.state = NoteState.hit;
          print(judgement);
          break;
        }
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