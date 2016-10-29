import 'dart:html';

import 'color.dart';
import 'tween.dart';
import 'util.dart';

class Column {
  static const keyHeight = 100;
  static const receptorHeight = 24;

  static final CanvasElement canvas = querySelector('#game');

  final Color color;
  final num left;
  final num width;
  final brightness = new Tween(1, 0, 0.2);
  bool pressed = false;

  Column(this.left, this.width, this.color);

  update(num dt) {
    if (pressed) {
      brightness.reset();
    } else {
      brightness.update(dt);
    }
  }

  drawBacklight() {
    canvas.context2D
      ..fillStyle = color.withOpacity(lerp(0.05, 0.12, brightness.value))
      ..fillRect(left, 0, width, canvas.height);
  }

  drawReceptor() {
    canvas.context2D
      ..fillStyle = color.withOpacity(lerp(0.15, 0.3, brightness.value))
      ..fillRect(left, canvas.height - keyHeight, width, -receptorHeight);
  }

  drawKey() {
    canvas.context2D
      ..fillStyle = color.darkenedBy(lerp(0.2, 0, brightness.value))
      ..fillRect(left, canvas.height, width, -keyHeight);
  }
}
