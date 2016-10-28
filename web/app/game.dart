import 'dart:html';
import 'dart:math';

import 'bg_animation.dart';
import 'color.dart';
import 'notefield.dart';
import 'note.dart';

enum Judgement { absolute, perfect, great, miss, none }

class TimingWindow {
  static const absolute = 25 / 1000;
  static const perfect = 80 / 1000;
  static const great = 140 / 1000;

  static Judgement judge(num timing) {
    timing = timing.abs();
    if (timing <= absolute) return Judgement.absolute;
    if (timing <= perfect) return Judgement.perfect;
    if (timing <= great) return Judgement.great;
    return Judgement.none;
  }
}

typedef num EasingFunction(num delta);

class Tween {
  static final EasingFunction linear = (num delta) => delta;
  static final EasingFunction quadOut = (num delta) => pow(delta, 1/2);

  final num start;
  final num end;
  final num duration;
  final num delay;
  EasingFunction easing;
  num time = 0;

  Tween(this.start, this.end, this.duration, [this.delay = 0, this.easing]) {
    easing ??= quadOut;
  }

  setTime(num _time) {
    time = _time;
  }

  update(num dt) {
    setTime(time + dt);
  }

  reset() {
    setTime(0);
  }

  num get value {
    final delta = ((time - delay) / duration).clamp(0, 1);
    return start + (end - start) * easing(delta);
  }
}

class JudgementAnimation {
  Color color;
  String text;
  final bounce = new Tween(30, 0, 0.3);

  play() {
    bounce.reset();
  }

  update(num dt) {
    bounce.update(dt);
  }

  draw() {
    final CanvasElement canvas = querySelector('#game');

    canvas.context2D
      ..font = '64px Roboto'
      ..textAlign = 'center'
      ..fillStyle = 'black'
      ..fillText('TEST', 300, canvas.height / 2 + bounce.value);
  }
}

class Game {
  static final List<KeyCode> keybinds = [
    KeyCode.A,
    KeyCode.S,
    KeyCode.D,
    KeyCode.K,
    KeyCode.L,
    KeyCode.SEMICOLON,
  ];

  final List<Note> notes = [];
  final judgeanim = new JudgementAnimation();

  num songTime = -3;
  BackgroundAnimation bg;
  Notefield notefield;

  Game() {
    bg = new BackgroundAnimation();
    notefield = new Notefield();

    notes.add(new Note(0 / 2, 0));
    notes.add(new Note(1 / 2, 1));
    notes.add(new Note(2 / 2, 2));
    notes.add(new Note(3 / 2, 3));
    notes.add(new Note(4 / 2, 4));
    notes.add(new Note(5 / 2, 5));
  }

  update(num dt) {
    songTime += dt;
    bg.update(dt);
    judgeanim.update(dt);
  }

  keydown(KeyboardEvent event) {
    for (final note in notes) {
      if (note.state == NoteState.active
      && event.keyCode == keybinds[note.column]) {
        final judgement = TimingWindow.judge(songTime - note.time);
        if (judgement != Judgement.none) {
          note.state = NoteState.hit;
          judgeanim.play();
          break;
        }
      }
    }
  }

  keyup(KeyboardEvent event) {}

  draw() {
    final CanvasElement canvas = querySelector('#game');

    canvas.context2D
      ..fillStyle = 'white'
      ..fillRect(0, 0, canvas.width, canvas.height);

    bg.draw();
    notefield.draw(notes, songTime);
    judgeanim.draw();
  }
}