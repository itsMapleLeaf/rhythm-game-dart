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
