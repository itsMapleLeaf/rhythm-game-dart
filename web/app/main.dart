import 'dart:html';

import 'game.dart';
import 'gameplay.dart';
import 'graphics.dart';

main() async {
  Game.pushState(new Gameplay());

  window.onKeyDown.listen(Game.keydown);
  window.onKeyUp.listen(Game.keyup);

  var time = await window.animationFrame;

  while (true) {
    final now = await window.animationFrame;
    final elapsed = (now - time) / 1000;
    time = now;

    Game.update(elapsed);

    reset();
    clear(Color.white);
    Game.draw();
  }
}