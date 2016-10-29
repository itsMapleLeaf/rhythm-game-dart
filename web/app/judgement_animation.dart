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

  static final textFromJudgement = {
    Judgement.absolute: 'ABSOLUTE',
    Judgement.perfect: 'PERFECT',
    Judgement.great: 'GREAT',
    Judgement.miss: 'BREAK',
  };

  static final colorFromJudgement = {
    Judgement.absolute: Color.blue,
    Judgement.perfect: Color.orange,
    Judgement.great: Color.green,
    Judgement.miss: Color.red,
  };

  Color color = Color.white;
  String text = '';
  Tween bounce = bounceNormal;
  Tween fade = fadeNormal;

  play(Judgement judgement) {
    bounce.reset();
    fade.reset();

    if (textFromJudgement[judgement] != null) {
      text = textFromJudgement[judgement];
    }
    if (colorFromJudgement[judgement] != null) {
      color = colorFromJudgement[judgement];
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
      ..fillStyle = color.withOpacity(fade.value)
      ..fillText(text, x, y + bounce.value);
  }
}
