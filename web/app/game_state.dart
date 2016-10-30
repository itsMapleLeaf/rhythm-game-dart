import 'dart:html' show KeyboardEvent;

abstract class GameState {
  GameState update(num dt);
  void keydown(KeyboardEvent event);
  void keyup(KeyboardEvent event);
  void draw();
}