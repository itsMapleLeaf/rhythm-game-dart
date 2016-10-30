import 'dart:html';

import 'bg_animation.dart';
import 'combo_animation.dart';
import 'game_state.dart';
import 'judgement_animation.dart';
import 'judgement.dart';
import 'note.dart';
import 'notefield.dart';

class Gameplay implements GameState {
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
  final JudgementAnimation judgeanim = new JudgementAnimation();
  final ComboAnimation comboanim = new ComboAnimation();

  num songTime = -3;
  BackgroundAnimation bg;
  Notefield notefield;

  Gameplay() {
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
    notefield.update(dt);
    judgeanim.update(dt);
    comboanim.update(dt);
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
    final note = notes
      .where(isActive)
      .where((note) => note.column == col)
      .first;

    if (note != null) {
      final judgement = TimingWindow.judge(songTime - note.time);
      if (judgement != Judgement.none) {
        note.state = NoteState.hit;
        comboanim.combo += 1;
        judgeanim.play(judgement);
        comboanim.play();
      }
    }
  }

  checkMisses() {
    final missed = notes.where(isActive).where(isMissed);
    if (missed.isNotEmpty) {
      missed.forEach((note) => note.state = NoteState.missed);
      judgeanim.play(Judgement.miss);
      comboanim.combo = 0;
    }
  }

  bool isActive(Note note) => note.state == NoteState.active;
  bool isMissed(Note note) => songTime > note.time + TimingWindow.great;

  draw() {
    canvas.context2D
      ..fillStyle = 'white'
      ..fillRect(0, 0, canvas.width, canvas.height);

    bg.draw();
    notefield.draw(notes, songTime);
    judgeanim.draw(Notefield.center, canvas.height / 2 + 100);
    comboanim.draw(Notefield.center, canvas.height / 2 - 120);
  }
}
