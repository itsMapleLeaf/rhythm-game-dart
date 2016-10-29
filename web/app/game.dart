import 'dart:html';

import 'bg_animation.dart';
import 'judgement.dart';
import 'judgement_animation.dart';
import 'note.dart';
import 'notefield.dart';

class Game {
  static final CanvasElement canvas = querySelector('#game');

  static final Map<int, int> keybinds = {
    [KeyCode.A]: 0,
    [KeyCode.S]: 1,
    [KeyCode.D]: 2,
    [KeyCode.K]: 3,
    [KeyCode.L]: 4,
    [KeyCode.SEMICOLON]: 5,
  };

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
    final col = keybinds[event.keyCode];
    notefield.setColumnPressed(col, true);
    checkTaps(col);
  }

  keyup(KeyboardEvent event) {
    final col = keybinds[event.keyCode];
    notefield.setColumnPressed(col, false);
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