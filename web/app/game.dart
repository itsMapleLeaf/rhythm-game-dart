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

  Rectangle background = new Rectangle(0, 0, canvas.width, canvas.height,
    Color.white);

  Rectangle shade = new Rectangle(0, 0, canvas.width, canvas.height,
    Color.white.withOpacity(0.4));

  List<Drawable> drawables = [];

  Game() {
    state = new SongSelect();
    bganim = new BackgroundAnimation();

    drawables.add(background);
    drawables.add(bganim as Drawable);
    drawables.add(shade);
  }

  update(num dt) {
    final newState = state.update(dt);
    if (newState != null) {
      state = newState;
    }
    bganim.update(dt);
  }

  draw() {
    for (final d in drawables) d.draw();
    state.draw();
  }

  keydown(KeyboardEvent event) => state.keydown(event);
  keyup(KeyboardEvent event) => state.keyup(event);
}
