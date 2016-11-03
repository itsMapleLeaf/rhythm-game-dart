import 'dart:html' show KeyboardEvent;

import 'bg_animation.dart';

class Game {
  static final bg = new BGAnimation();
  static List<GameState> states = [];

  static get currentState => states.last;

  static pushState(GameState state) => states.add(state);
  static popState(GameState state) => states.removeLast();

  static update(num dt) {
    bg.update(dt);
    currentState.update(dt);
  }
  static draw() {
    bg.draw();
    currentState.draw();
  }

  static keydown(KeyboardEvent event) => currentState.keydown(event);
  static keyup(KeyboardEvent event) => currentState.keyup(event);
}

abstract class GameState {
  update(num dt);
  draw();
  keydown(KeyboardEvent event);
  keyup(KeyboardEvent event);
}