import 'clock.dart';
import 'graphics.dart';
import 'util.dart';

class BGShape {
  num x, y, size;
  Color color;
}

class BGAnimation {
  static final shapeColors = [
    Color.red,
    Color.orange,
    Color.yellow,
    Color.green,
    Color.blue,
    Color.violet,
  ];

  final shapes = [];
  final shapeClock = new Clock(0.15);

  update(num dt) {
    // ignore huge deltas
    if (dt > 1) return;

    shapeClock.update(dt, addShape);
    shapes
      ..forEach((shape) => shape.y -= shape.size * dt)
      ..retainWhere((shape) => shape.y > -shape.size);
  }

  addShape() {
    final size = random(80, 160);
    final shape = new BGShape()
      ..x = random(0, canvas.width)
      ..y = canvas.height + size
      ..size = size
      ..color = shapeColors[random(0, shapeColors.length).floor()];

    shapes
      ..add(shape)
      ..sort((a, b) => a.size - b.size);
  }

  draw() {
    for (final shape in shapes) {
      drawPolygon(shape.x, shape.y, shape.size, 3, shape.color);
    }
  }
}
