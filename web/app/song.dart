enum NoteState {
  active,
  hit,
  missed,
}

class Note {
  num time;
  int column;
  NoteState state = NoteState.active;

  Note(this.time, this.column);
}

class Song {
  num time = -2;

  List<Note> notes = [
    new Note(0 / 2, 0),
    new Note(1 / 2, 1),
    new Note(2 / 2, 2),
    new Note(3 / 2, 3),
    new Note(4 / 2, 4),
    new Note(5 / 2, 5),
  ];

  update(num dt) {
    time += dt;
  }
}