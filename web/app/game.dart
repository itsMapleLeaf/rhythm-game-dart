import 'dart:html';

import 'gameplay.dart';
import 'game_state.dart';

class Game {
  GameState state;

  Game() {
    state = new Gameplay();
  }

  update(num dt) {
    state.update(dt);
  }

  keydown(KeyboardEvent event) {
    state.keydown(event);
  }

  keyup(KeyboardEvent event) {
    state.keyup(event);
  }

  draw() {
    state.draw();
  }
}
