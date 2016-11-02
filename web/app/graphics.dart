import 'dart:html';

import 'color.dart';

/// Draws a rectangle
drawRectangle(CanvasElement canvas, num x, num y, num width, num height, Color color) {
  canvas.context2D
    ..fillStyle = color
    ..fillRect(x, y, width, height);
}

clear(CanvasElement canvas, Color color) {
  canvas.context2D
    ..fillStyle = color
    ..fillRect(0, 0, canvas.width, canvas.height);
}