import 'dart:html' hide Rectangle;

import 'bg_animation.dart';
import 'color.dart';
// import 'gameplay.dart';
import 'game_state.dart';
import 'graphics.dart';
import 'song_select.dart';

class Game {
  static final CanvasElement canvas = querySelector('#game');

  GameState state;
  BackgroundAnimation bganim;

  Stage get stage => new Stage([
    new Rectangle(0, 0, canvas.width, canvas.height, Color.white),
    bganim,
    new Rectangle(0, 0, canvas.width, canvas.height, Color.white.withOpacity(0.4)),
    state,
  ]);

  Game() {
    state = new SongSelect();
    bganim = new BackgroundAnimation();
  }

  update(num dt) {
    final newState = state.update(dt);
    if (newState != null) {
      state = newState;
    }
    bganim.update(dt);
  }

  draw() {
    stage.draw();
  }

  keydown(KeyboardEvent event) => state.keydown(event);
  keyup(KeyboardEvent event) => state.keyup(event);
}
