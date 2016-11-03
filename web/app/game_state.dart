import 'dart:html' show KeyboardEvent;

abstract class GameState {
  update(num dt);
  draw();
  keydown(KeyboardEvent event);
  keyup(KeyboardEvent event);
}