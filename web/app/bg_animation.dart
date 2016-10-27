import 'dart:html';
import 'dart:math';

import 'clock.dart';
import 'color.dart';
import 'random.dart';
import 'triangle_shape.dart';

class BackgroundAnimation {
  final CanvasElement canvas;
  final List<TriangleShape> shapes = [];
  final Clock clock = new Clock(0.1);

  static final List<Color> colors = [
    Red,
    Orange,
    Yellow,
    Green,
    Blue,
    Violet,
  ];

  BackgroundAnimation(this.canvas);

  addShape() {
    final x = intRange(0, canvas.width);
    final y = canvas.height + 100;
    final size = doubleRange(3, 6);
    final color = colors[intRange(0, colors.length)];
    shapes
      ..add(new TriangleShape(x, y, size, color))
      ..sort((a, b) => a.size - b.size);
  }

  update(num dt) {
    // ignore updates with big deltas
    if (dt > 1) return;

    clock.update(dt, addShape);
    for (final shape in shapes) {
      shape.pos -= new Point(0, 30 * shape.size * dt);
    }
    shapes.retainWhere((shape) => shape.pos.y > -100);
  }

  draw() {
    for (final shape in shapes) {
      shape.draw(canvas);
    }
  }
}