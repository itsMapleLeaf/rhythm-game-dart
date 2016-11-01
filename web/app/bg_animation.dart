import 'dart:html';

import 'clock.dart';
import 'color.dart';
import 'graphics.dart';
import 'util.dart';

class BackgroundAnimation {
  static final CanvasElement canvas = querySelector('#game');
  final List<Polygon> shapes = [];
  final Clock clock = new Clock(0.1);

  static final List<Color> colors = [
    Color.red,
    Color.orange,
    Color.yellow,
    Color.green,
    Color.blue,
    Color.violet,
  ];

  addShape() {
    final x = random(0, canvas.width);
    final y = canvas.height + 100;
    final size = random(60, 120);
    final color = colors[random(0, colors.length).floor()];
    shapes
      ..add(new Polygon(x, y, size, color, 3))
      ..sort((a, b) => a.size - b.size);
  }

  update(num dt) {
    // ignore updates with big deltas
    if (dt > 1) return;

    clock.update(dt, addShape);
    for (final shape in shapes) {
      shape.y -= shape.size * dt;
    }
    shapes.retainWhere((shape) => shape.y > -100);
  }

  draw() {
    for (final shape in shapes) {
      shape.draw();
    }
  }
}
