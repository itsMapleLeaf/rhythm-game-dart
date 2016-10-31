import 'dart:html';

import 'bg_animation.dart';
import 'color.dart';
// import 'gameplay.dart';
import 'game_state.dart';
import 'song_select.dart';

class Game {
  final CanvasElement canvas = querySelector('#game');

  GameState state;
  BackgroundAnimation bg;

  Game() {
    state = new SongSelect();
    bg = new BackgroundAnimation();
  }

  update(num dt) {
    final newState = state.update(dt);
    if (newState != null) {
      state = newState;
    }

    bg.update(dt);
  }

  draw() {
    clear();
    bg.draw();
    drawWhiteShade();
    state.draw();
  }

  clear() {
    canvas.context2D
      ..fillStyle = Color.white
      ..fillRect(0, 0, canvas.width, canvas.height);
  }

  drawWhiteShade() {
    canvas.context2D
      ..fillStyle = Color.white.withOpacity(0.4)
      ..fillRect(0, 0, canvas.width, canvas.height);
  }

  keydown(KeyboardEvent event) => state.keydown(event);
  keyup(KeyboardEvent event) => state.keyup(event);
}
