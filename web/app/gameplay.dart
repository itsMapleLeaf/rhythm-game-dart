import 'bg_animation.dart';
import 'notefield.dart';
import 'song.dart';

class Gameplay {
  final bg = new BGAnimation();
  final notefield = new NoteField();
  final song = new Song();

  update(num dt) {
    song.update(dt);
    bg.update(dt);
  }

  draw() {
    bg.draw();
    notefield.draw(song);
  }
}