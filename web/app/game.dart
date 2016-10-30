import 'dart:html';

import 'gameplay.dart';

class Game {
  final gameplay = new Gameplay();

  update(num dt) {
    gameplay.update(dt);
  }

  keydown(KeyboardEvent event) {
    gameplay.keydown(event);
  }

  keyup(KeyboardEvent event) {
    gameplay.keyup(event);
  }

  draw() {
    gameplay.draw();
  }
}
