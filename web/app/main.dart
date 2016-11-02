import 'dart:html';

import 'gameplay.dart';
import 'color.dart';
import 'graphics.dart';

main() async {
  final gameplay = new Gameplay();

  var time = await window.animationFrame;

  while (true) {
    final now = await window.animationFrame;
    final elapsed = (now - time) / 1000;
    time = now;

    gameplay.update(elapsed);

    reset();
    clear(Color.white);
    gameplay.draw();
  }
}