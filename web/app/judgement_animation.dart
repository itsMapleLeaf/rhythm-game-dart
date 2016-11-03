import 'dart:math' show pow;

import 'graphics.dart';
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
    if (judgement != Judgement.miss) {
      final delta = util.delta(time, 0, 0.3);
      final value = util.lerp(1, 0, delta);
      return pow(value, 3) * 30;
    } else {
      return util.lerp(0, 1, util.delta(time, 0, 1)) * 30;
    }
  }

  num get fade {
    if (judgement != Judgement.miss) {
      final delta = util.delta(time, 1, 1.2);
      final value = util.lerp(1, 0, delta);
      return value;
    } else {
      return util.lerp(1, 0, util.delta(time, 0.5, 1));
    }
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