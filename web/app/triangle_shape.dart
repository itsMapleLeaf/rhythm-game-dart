import 'dart:html';
import 'dart:math';

import 'color.dart';

class TriangleShape {
  static final CanvasElement canvas = querySelector('#game');

  num x, y, size;
  Color color;

  TriangleShape(this.x, this.y, this.size, this.color);

  draw() {
    final ctx = canvas.context2D;

    ctx
      ..fillStyle = color
      ..beginPath();

    for (num i = 0; i < 3; i++) {
      final angle = i / 3 * PI * 2;
      final ox = -sin(angle) * size * 20;
      final oy = -cos(angle) * size * 20;
      ctx.lineTo(x + ox, y + oy);
    }

    ctx.fill();
  }
}