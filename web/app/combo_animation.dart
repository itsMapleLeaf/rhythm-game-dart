import 'dart:html';

import 'tween.dart';

class ComboAnimation {
  static final CanvasElement canvas = querySelector('#game');

  final bounce = new Tween(0.7, 1, 0.2);
  int combo = 0;

  play() {
    bounce.reset();
  }

  update(num dt) {
    bounce.update(dt);
  }

  draw(num x, num y) {
    if (combo < 1) return;
    canvas.context2D
      ..save()
      ..font = '72px Unica One'
      ..fillStyle = 'white'
      ..textAlign = 'center'
      ..translate(x, y)
      ..scale(bounce.value, bounce.value)
      ..fillText(combo.toString(), 0, 0)
      ..restore();
  }
}
