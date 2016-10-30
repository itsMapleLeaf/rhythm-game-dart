import 'dart:html';

import 'gameplay.dart';
import 'game_state.dart';

class Game {
  GameState state;

  Game() {
    state = new Gameplay();
  }

  update(num dt) {
    state = state.update(dt);
  }

  draw() {
    state.draw();
  }

  keydown(KeyboardEvent event) {
    state.keydown(event);
  }

  keyup(KeyboardEvent event) {
    state.keyup(event);
  }
}
