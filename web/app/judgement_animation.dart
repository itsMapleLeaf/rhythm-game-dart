import 'dart:html';

import 'color.dart';
import 'judgement.dart';
import 'tween.dart';

class JudgementAnimation {
  static final CanvasElement canvas = querySelector('#game');

  static Tween bounceNormal() => new Tween(30, 0, 0.3);
  static Tween bounceMiss() => new Tween(0, 40, 1, 0, Tween.linear);

  static Tween fadeNormal() => new Tween(1, 0, 0.2, 1);
  static Tween fadeMiss() => new Tween(1, 0, 0.5, 0.5);

  Judgement judgement;
  Tween bounce;
  Tween fade;
  num time = 0;

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

  play(Judgement judgement) {
    if (judgement == Judgement.miss) {
      bounce = bounceMiss();
      fade = fadeMiss();
    } else {
      bounce = bounceNormal();
      fade = fadeNormal();
    }
    bounce.reset();
    fade.reset();
  }

  update(num dt) {
    bounce.update(dt);
    fade.update(dt);
  }

  draw(num x, num y) {
    canvas.context2D
      ..font = '64px Unica One'
      ..textAlign = 'center'
      ..fillStyle = color.withOpacity(fade.value)
      ..fillText(text, x, y + bounce.value);
  }
}
