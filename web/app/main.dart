import 'dart:html';

import 'bg_animation.dart';
import 'color.dart';
import 'notefield.dart';
import 'graphics.dart';

/// Model representing the game's state
// class GameModel {}

main() async {
  final bg = new BGAnimation();

  final notefield = new NoteField()
    ..leftOffset = 250
    ..columnCount = 6
    ..columnWidth = 48
    ..columnColors = [
      Color.yellow,
      Color.white,
      Color.violet,
      Color.white,
      Color.violet,
      Color.white,
    ];

  var time = await window.animationFrame;

  while (true) {
    final now = await window.animationFrame;
    final elapsed = (now - time) / 1000;
    time = now;

    bg.update(elapsed);

    reset();
    clear(Color.white);

    bg.draw();

    layer(() {
      notefield.draw();
    });
  }
}