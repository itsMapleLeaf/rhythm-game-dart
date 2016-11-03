import 'dart:math' show pow;

import 'graphics.dart';
import 'util.dart' as util;

class ComboAnimation {
  num x, y;
  num time = 0;
  int combo = 0;

  ComboAnimation(this.x, this.y);

  num get scale {
    final delta = util.delta(time, 0, 0.2);
    final value = util.lerp(0.6, 1, pow(delta, 1 / 3));
    return value;
  }

  addCombo(int count) {
    combo += count;
    play();
  }

  reset() {
    combo = 0;
  }

  play() {
    time = 0;
  }

  update(num dt) {
    time += dt;
  }

  draw() {
    if (combo == 0) return;

    layer(() {
      canvas.context2D
        ..translate(x, y)
        ..scale(scale, scale);
      drawText(combo.toString(), 0, 0, Color.white, Font.unicaOne(72), 'center');
    });
  }
}