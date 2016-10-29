import 'dart:html';
import 'dart:math';

import 'color.dart';

class TriangleShape {
  static final CanvasElement canvas = querySelector('#game');

  Point pos;
  final num size;
  final Color color;

  TriangleShape(x, y, this.size, this.color) {
    pos = new Point(x, y);
  }

  draw() {
    final ctx = canvas.context2D;

    ctx
      ..fillStyle = color
      ..beginPath();

    for (num i = 0; i < 3; i++) {
      final angle = i / 3 * PI * 2;
      final x = -sin(angle) * size * 20;
      final y = -cos(angle) * size * 20;
      ctx.lineTo(pos.x + x, pos.y + y);
    }

    ctx.fill();
  }
}