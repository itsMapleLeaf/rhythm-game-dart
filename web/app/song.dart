/// Enum representing the state of a note
///
/// * active: Note is scrolling down, has not been judged.
/// * hit: Note has been hit and judged.
/// * missed: Note was missed.
/// * holding: It's a hold note currently being held down.
enum NoteState {
  active,
  hit,
  missed,
  holding,
}

class Note {
  /// The time the head of the note is to be tapped
  num time;

  /// Whichever column the note is in
  int column;

  /// The hold length of the note, 0 if it's a tap note
  num length;

  /// The current state of the note (see [NoteState])
  NoteState state = NoteState.active;

  Note(this.time, this.column, this.length);
}

enum Judgement {
  absolute,
  perfect,
  great,
  miss,
  none,
}

class Song {
  static const timingAbsolute = 20 / 1000;
  static const timingPerfect = 80 / 1000;
  static const timingGreat = 150 / 1000;

  num time = -2;

  List<Note> notes = [
    new Note(0 / 2, 0, 0.5),
    new Note(1 / 2, 1, 0.5),
    new Note(2 / 2, 2, 0.5),
    new Note(3 / 2, 3, 0.5),
    new Note(4 / 2, 4, 0.5),
    new Note(5 / 2, 5, 0.5),
  ];

  update(num dt) {
    time += dt;
  }

  /// Attempt to find a tappable note, update its state, and return the judgement
  /// given
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

  /// Find any missed notes
  ///
  /// A note is missed when it's passed the maximum timing window at which a note
  /// can be hit.
  bool checkMisses() {
    final missed = notes
      .where((note) => note.state == NoteState.active)
      .where((note) => time > note.time + timingGreat)
      ..forEach((note) => note.state = NoteState.missed);

    return missed.isNotEmpty;
  }
}