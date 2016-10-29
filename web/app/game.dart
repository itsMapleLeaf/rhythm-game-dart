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

  static final CanvasElement canvas = querySelector('#game');

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
    final col = keybinds.indexOf(event.keyCode);
    if (col > -1) {
      notefield.setColumnPressed(col, true);
      checkTaps(col);
    }
  }

  keyup(KeyboardEvent event) {
    final col = keybinds.indexOf(event.keyCode);
    if (col > -1) {
      notefield.setColumnPressed(col, false);
    }
  }

  checkTaps(int col) {
    final note =
      notes.firstWhere((note) => isActive(note) && note.column == col);

    if (note != null) {
      final judgement = TimingWindow.judge(songTime - note.time);
      if (judgement != Judgement.none) {
        note.state = NoteState.hit;
        judgeanim.play(judgement);
      }
    }
  }

  checkMisses() {
    final missed = notes
      .where((note) => isActive(note) && isMissed(note))
      ..forEach((note) => note.state = NoteState.missed);

    if (missed.isNotEmpty) {
      judgeanim.play(Judgement.miss);
    }
  }

  bool isActive(Note note) {
    return note.state == NoteState.active;
  }

  bool isMissed(Note note) {
    return songTime > note.time + TimingWindow.great;
  }

  draw() {
    canvas.context2D
      ..fillStyle = 'white'
      ..fillRect(0, 0, canvas.width, canvas.height);

    bg.draw();
    notefield.draw(notes, songTime);
    judgeanim.draw(Notefield.center, canvas.height / 2 + 100);
  }
}