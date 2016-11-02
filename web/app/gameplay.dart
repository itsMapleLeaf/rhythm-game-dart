import 'bg_animation.dart';
import 'notefield.dart';

class Gameplay {
  final bg = new BGAnimation();
  final notefield = new NoteField();

  update(num dt) {
    bg.update(dt);
  }

  draw() {
    bg.draw();
    notefield.draw();
  }
}