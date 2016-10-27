import 'dart:html';

import 'bg_animation.dart';
import 'notefield.dart';

class Game {
  final CanvasElement canvas;
  BackgroundAnimation bg;
  Notefield notefield;

  Game(this.canvas) {
    bg = new BackgroundAnimation(canvas);
    notefield = new Notefield(canvas);
  }

  update(num dt) {
    bg.update(dt);
  }

  draw() {
    canvas.context2D
      ..fillStyle = 'white'
      ..fillRect(0, 0, canvas.width, canvas.height);

    bg.draw();
    notefield.draw();

    canvas.context2D
      ..font = '32px Roboto'
      ..fillStyle = 'black'
      ..fillText(bg.shapes.length.toString(), 10, 50);
  }
}