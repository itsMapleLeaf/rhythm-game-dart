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

enum Judgement {
  absolute,
  perfect,
  great,
  none,
}

class Song {
  static const timingAbsolute = 20 / 1000;
  static const timingPerfect = 80 / 1000;
  static const timingGreat = 150 / 1000;

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

  Judgement checkTap(int column) {
    final tapped = notes
      .where((note) => note.column == column)
      .where((note) => note.state == NoteState.active)
      .where((note) => (time - note.time).abs() <= timingGreat);

    if (tapped.isNotEmpty) {
      final note = tapped.first;
      final timing = (time - note.time).abs();
      note.state = NoteState.hit;

      if (timing <= timingAbsolute) return Judgement.absolute;
      if (timing <= timingPerfect) return Judgement.perfect;
      if (timing <= timingGreat) return Judgement.great;
    }

    return Judgement.none;
  }

  bool checkMisses() {
    final missed = notes
      .where((note) => note.state == NoteState.active)
      .where((note) => time > note.time + 0.1);

    if (missed.isNotEmpty) {
      missed.forEach((note) => note.state = NoteState.missed);
    }
    return missed.isNotEmpty;
  }
}