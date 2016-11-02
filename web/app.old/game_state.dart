import 'dart:html' show KeyboardEvent;

abstract class GameState {
  update(num dt);
  keydown(KeyboardEvent event);
  keyup(KeyboardEvent event);
  draw();
}