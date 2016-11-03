import 'dart:html';
import 'dart:math';

import 'bg_animation.dart';
import 'graphics.dart';
import 'notefield.dart';
import 'song.dart';
import 'util.dart' as util;

class JudgementAnimation {
  num x, y;
  num time = 0;
  Judgement judgement;

  JudgementAnimation(this.x, this.y);

  String get text {
    switch (judgement) {
      case Judgement.absolute: return 'ABSOLUTE';
      case Judgement.perfect: return 'PERFECT';
      case Judgement.great: return 'GREAT';
      case Judgement.miss: return 'BREAK';
      default: return '';
    }
  }

  Color get color {
    switch (judgement) {
      case Judgement.absolute: return Color.blue;
      case Judgement.perfect: return Color.orange;
      case Judgement.great: return Color.green;
      case Judgement.miss: return Color.red;
      default: return Color.white;
    }
  }

  num get offset {
    return pow(util.lerp(1, 0, util.delta(time, 0, 0.3)), 2) * 30;
  }

  play() {
    time = 0;
  }

  update(num dt) {
    time += dt;
  }

  draw() {
    drawText(text, x, y + offset, color, Font.unicaOne(64), 'center');
  }
}

class Gameplay {
  final bg = new BGAnimation();
  final notefield = new NoteField();
  final song = new Song();

  final judgementAnimation = new JudgementAnimation(
    250 + NoteField.totalWidth / 2, canvas.height / 2 + 100);

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
      judgementAnimation.judgement = judgement;
      if (judgement != Judgement.none) {
        judgementAnimation.play();
      }
    }
  }

  keyup(KeyboardEvent event) {}

  update(num dt) {
    bg.update(dt);
    notefield.update(dt);
    song.update(dt);
    song.checkMisses();
    judgementAnimation.update(dt);
  }

  draw() {
    bg.draw();
    notefield.draw(song);
    judgementAnimation.draw();
  }
}