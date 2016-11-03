import 'bg_animation.dart';
import 'notefield.dart';
import 'note.dart';

class Gameplay {
  final bg = new BGAnimation();
  final notefield = new NoteField();

  final notes = [
    new Note()..time = 0..column = 0,
    new Note()..time = 1..column = 1,
    new Note()..time = 2..column = 2,
    new Note()..time = 3..column = 3,
    new Note()..time = 4..column = 4,
    new Note()..time = 5..column = 5,
  ];

  update(num dt) {
    bg.update(dt);
  }

  draw() {
    bg.draw();
    notefield.draw(notes);
  }
}