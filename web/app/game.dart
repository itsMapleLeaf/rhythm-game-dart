import 'dart:html' show KeyboardEvent;

import 'game_state.dart';

class Game {
  static List<GameState> states = [];

  static get currentState => states.last;

  static pushState(GameState state) => states.add(state);
  static popState(GameState state) => states.removeLast();

  static update(num dt) => currentState.update(dt);
  static draw() => currentState.draw();
  static keydown(KeyboardEvent event) => currentState.keydown(event);
  static keyup(KeyboardEvent event) => currentState.keyup(event);
}
