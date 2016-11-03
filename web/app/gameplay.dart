import 'dart:html';

import 'bg_animation.dart';
import 'combo_animation.dart';
import 'game_state.dart';
import 'graphics.dart';
import 'judgement_animation.dart';
import 'notefield.dart';
import 'song.dart';

class Gameplay implements GameState {
  final bg = new BGAnimation();
  final notefield = new NoteField();
  final song = new Song();

  final judgementAnimation = new JudgementAnimation(
    NoteField.centerX, canvas.height / 2 + 100);

  final comboAnimation = new ComboAnimation(
    NoteField.centerX, canvas.height / 2 - 140);

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
      final judgement = song.checkTap(index);
      if (judgement != Judgement.none) {
        judgementAnimation.play(judgement);
        comboAnimation.addCombo(1);
      }
    }
  }

  keyup(KeyboardEvent event) {}

  update(num dt) {
    if (song.checkMisses()) {
      judgementAnimation.play(Judgement.miss);
      comboAnimation.reset();
    }

    bg.update(dt);
    notefield.update(dt);
    song.update(dt);
    judgementAnimation.update(dt);
    comboAnimation.update(dt);
  }

  draw() {
    bg.draw();
    notefield.draw(song);
    judgementAnimation.draw();
    comboAnimation.draw();
  }
}