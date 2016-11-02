import 'color.dart';
import 'clock.dart';
import 'graphics.dart';
import 'util.dart';

class BGShape {
  num x, y;
}

class BGAnimation {
  final shapes = [];
  final shapeClock = new Clock(0.3);

  update(num dt) {
    shapeClock.update(dt, addShape);
    shapes
      ..forEach((shape) => shape.y -= 100 * dt)
      ..retainWhere((shape) => shape.y > -100);
  }

  addShape() {
    shapes.add(new BGShape()
      ..x = random(0, canvas.width)
      ..y = canvas.height + 100
    );
  }

  draw() {
    for (final shape in shapes) {
      drawPolygon(shape.x, shape.y, 100, 3, Color.blue);
    }
  }
}
