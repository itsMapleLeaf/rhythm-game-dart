import 'color.dart';
import 'graphics.dart';
import 'util.dart';

class BGShape {
  num x, y;
}

class BGAnimation {
  final shapes = [];
  num shapeClock = 0;

  update(num dt) {
    if ((shapeClock += dt) >= 0.3) {
      shapeClock -= 0.3;
      shapes.add(new BGShape()
        ..x = random(0, canvas.width)
        ..y = canvas.height + 100
      );
    }

    for (final shape in shapes) {
      shape.y -= 100 * dt;
    }

    shapes.retainWhere((shape) => shape.y > -100);
  }

  draw() {
    for (final shape in shapes) {
      drawPolygon(shape.x, shape.y, 100, 3, Color.blue);
    }
  }
}
