import 'bg_animation.dart';
import 'color.dart';
import 'notefield.dart';

class Gameplay {
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

  update(num dt) {
    bg.update(dt);
  }

  draw() {
    bg.draw();
    notefield.draw();
  }
}