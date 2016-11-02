import 'dart:html';

import 'color.dart';

final CanvasElement canvas = querySelector('#game');

/// Draws a rectangle
drawRectangle(
  num x,
  num y,
  num width,
  num height,
  Color color,
) {
  canvas.context2D
    ..fillStyle = color
    ..fillRect(x, y, width, height);
}

/// Clear the canvas area to a given color
clear(Color color) {
  canvas.context2D
    ..fillStyle = color
    ..fillRect(0, 0, canvas.width, canvas.height);
}

/// Reset the canvas transform state
reset() {
  canvas.context2D.resetTransform();
}

/// Perform drawing transforms within a transformation context
layer(drawOps()) {
  canvas.context2D.save();
  drawOps();
  canvas.context2D.restore();
}