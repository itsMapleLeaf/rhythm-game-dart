import 'dart:html';

import 'color.dart';

class Column {
  static const keyHeight = 100;
  static const receptorHeight = 24;
  static final CanvasElement canvas = querySelector('#game');

  final Color color;
  final num left;
  final num width;

  Column(this.left, this.width, this.color);

  drawBacklight() {
    canvas.context2D
      ..fillStyle = color.opacity(0.05)
      ..fillRect(left, 0, width, canvas.height);
  }

  drawReceptor() {
    canvas.context2D
      ..fillStyle = color.opacity(0.3)
      ..fillRect(left, canvas.height - keyHeight, width, -receptorHeight);
  }

  drawKey() {
    canvas.context2D
      ..fillStyle = color
      ..fillRect(left, canvas.height, width, -keyHeight);
  }
}
