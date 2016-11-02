import 'dart:math';

typedef num EasingFunction(num delta);

class Tween {
  static final EasingFunction linear = (num delta) => delta;
  static final EasingFunction quadOut = (num delta) => pow(delta, 1/2);

  final num start;
  final num end;
  final num duration;
  final num delay;
  EasingFunction easing;
  num time = 0;

  Tween(this.start, this.end, this.duration, [this.delay = 0, this.easing]) {
    easing ??= quadOut;
  }

  setTime(num _time) {
    time = _time;
  }

  update(num dt) {
    setTime(time + dt);
  }

  reset() {
    setTime(0);
  }

  num get value {
    final delta = ((time - delay) / duration).clamp(0, 1);
    return start + (end - start) * easing(delta);
  }
}
