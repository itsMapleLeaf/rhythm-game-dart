enum Judgement { absolute, perfect, great, miss, none }

class TimingWindow {
  static const double absolute = 25 / 1000;
  static const double perfect = 80 / 1000;
  static const double great = 140 / 1000;

  static Judgement judge(num timing) {
    timing = timing.abs();
    if (timing <= absolute) return Judgement.absolute;
    if (timing <= perfect) return Judgement.perfect;
    if (timing <= great) return Judgement.great;
    return Judgement.none;
  }
}
