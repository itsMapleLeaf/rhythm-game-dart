import 'dart:html';

import 'bg_animation.dart';
import 'judgement.dart';
import 'judgement_animation.dart';
import 'note.dart';
import 'notefield.dart';

class Game {
  static final List<int> keybinds = [
    KeyCode.A,
    KeyCode.S,
    KeyCode.D,
    KeyCode.K,
    KeyCode.L,
    KeyCode.SEMICOLON,
  ];

  final List<Note> notes = [];
  final judgeanim = new JudgementAnimation();

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
    judgeanim.update(dt);
    notefield.update(dt);

    checkMisses();
  }

  keydown(KeyboardEvent event) {
    final index = keybinds.indexOf(event.keyCode);
    notefield.setColumnPressed(index, true);
    checkTaps(index);
  }

  keyup(KeyboardEvent event) {
    final index = keybinds.indexOf(event.keyCode);
    notefield.setColumnPressed(index, false);
  }

  checkTaps(int col) {
    for (final note in notes) {
      if (note.state == NoteState.active && note.column == col) {
        final judgement = TimingWindow.judge(songTime - note.time);
        if (judgement != Judgement.none) {
          note.state = NoteState.hit;
          judgeanim.play(judgement);
          break;
        }
      }
    }
  }

  checkMisses() {
    for (final note in notes) {
      if (note.state == NoteState.active
      && songTime > note.time + TimingWindow.great) {
        note.state = NoteState.missed;
        judgeanim.play(Judgement.miss);
      }
    }
  }

  draw() {
    final CanvasElement canvas = querySelector('#game');

    canvas.context2D
      ..fillStyle = 'white'
      ..fillRect(0, 0, canvas.width, canvas.height);

    bg.draw();
    notefield.draw(notes, songTime);
    judgeanim.draw(
      Notefield.leftOffset + Notefield.totalWidth / 2,
      canvas.height / 2 + 100);
  }
}