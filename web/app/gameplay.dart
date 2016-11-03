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
    final delta = util.delta(time, 0, 0.3);
    final value = util.lerp(1, 0, delta);
    return pow(value, 3) * 30;
  }

  num get fade {
    final delta = util.delta(time, 1, 1.2);
    final value = util.lerp(1, 0, delta);
    return value;
  }

  play(Judgement judgement) {
    this.judgement = judgement;
    time = 0;
  }

  update(num dt) {
    time += dt;
  }

  draw() {
    drawText(text, x, y + offset, color.withOpacity(fade), Font.unicaOne(64), 'center');
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
      if (judgement != Judgement.none) {
        judgementAnimation.play(judgement);
      }
    }
  }

  keyup(KeyboardEvent event) {}

  update(num dt) {
    if (song.checkMisses()) {
      judgementAnimation.play(Judgement.miss);
    }

    bg.update(dt);
    notefield.update(dt);
    song.update(dt);
    judgementAnimation.update(dt);
  }

  draw() {
    bg.draw();
    notefield.draw(song);
    judgementAnimation.draw();
  }
}