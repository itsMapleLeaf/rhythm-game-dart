import 'dart:html';

import 'color.dart';
import 'judgement.dart';
import 'tween.dart';

class JudgementAnimation {
  static final CanvasElement canvas = querySelector('#game');

  static final bounceNormal = new Tween(30, 0, 0.3);
  static final bounceMiss = new Tween(0, 40, 1, 0, Tween.linear);

  static final fadeNormal = new Tween(1, 0, 0.2, 1);
  static final fadeMiss = new Tween(1, 0, 0.5, 0.5);

  Tween bounce = bounceNormal;
  Tween fade = fadeNormal;

  Color color = White;
  String text = '';

  play(Judgement judgement) {
    bounce.reset();
    fade.reset();

    switch (judgement) {
      case Judgement.absolute:
        text = 'ABSOLUTE';
        color = Blue;
        break;
      case Judgement.perfect:
        text = 'PERFECT';
        color = Orange;
        break;
      case Judgement.great:
        text = 'GREAT';
        color = Green;
        break;
      case Judgement.miss:
        text = 'BREAK';
        color = Red;
        break;
      default:
        text = '';
    }

    if (judgement == Judgement.miss) {
      bounce = bounceMiss;
      fade = fadeMiss;
    } else {
      bounce = bounceNormal;
      fade = fadeNormal;
    }
  }

  update(num dt) {
    bounce.update(dt);
    fade.update(dt);
  }

  draw(num x, num y) {
    canvas.context2D
      ..font = '64px Unica One'
      ..textAlign = 'center'
      ..fillStyle = color.opacity(fade.value)
      ..fillText(text, x, y + bounce.value);
  }
}
