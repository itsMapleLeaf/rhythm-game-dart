import 'dart:html' show CanvasElement, querySelector;
import 'dart:math' show sin, cos, PI;

import 'color.dart' show Color;

abstract class Drawable {
  num x, y;
  Color color;
  void draw();
}

/// An equilateral polygon
class Polygon implements Drawable {
  static CanvasElement canvas = querySelector('#game');

  num x, y, size;
  Color color;
  int sides;
  num rotation = 0;

  Polygon(this.x, this.y, this.size, this.color, this.sides);

  draw() {
    final ctx = canvas.context2D;

    ctx
      ..fillStyle = color
      ..translate(x, y)
      ..rotate(rotation)
      ..beginPath()
      ;

    for (int i = 0; i < sides; i++) {
      final angle = i / sides * PI * 2;
      final x = -sin(angle) * size;
      final y = -cos(angle) * size;
      ctx.lineTo(x, y);
    }

    ctx.fill();
  }
}

/// A rectangle
class Rectangle implements Drawable {
  static CanvasElement canvas = querySelector('#game');

  num x, y, width, height;
  Color color;

  Rectangle(this.x, this.y, this.width, this.height, this.color);

  draw() {
    canvas.context2D
      ..fillStyle = color
      ..fillRect(x, y, width, height)
      ;
  }
}

/// Drawable container
class Stage implements Drawable {
  num x = 0;
  num y = 0;
  Color color = Color.white;
  List<Drawable> children;

  Stage(this.children);

  add(Drawable child) {
    children.add(child);
  }

  remove(Drawable child) {
    children.remove(child);
  }

  draw() {
    for (final child in children) {
      child.draw();
    }
  }
}