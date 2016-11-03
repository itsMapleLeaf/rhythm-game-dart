import 'bg_animation.dart';
import 'notefield.dart';
import 'note.dart';

class Gameplay {
  final bg = new BGAnimation();
  final notefield = new NoteField();

  final notes = [
    new Note(0 / 2, 0),
    new Note(1 / 2, 1),
    new Note(2 / 2, 2),
    new Note(3 / 2, 3),
    new Note(4 / 2, 4),
    new Note(5 / 2, 5),
  ];

  num songTime = -2;

  update(num dt) {
    songTime += dt;
    bg.update(dt);
  }

  draw() {
    bg.draw();
    notefield.draw(notes, songTime);
  }
}