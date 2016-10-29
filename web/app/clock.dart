/// For working with recurring tasks.
///
/// This is coded so the clock doesn't fall behind when the time goes too
/// far beyond the limit.
///
/// Example:
/// Clock clock = new Clock(0.5); // a clock that ticks every 0.5 seconds
/// clock.update(1); // will trigger two ticks.
class Clock {
  /// The current clock's time
  num time = 0;

  /// The time limit for each tick
  final num limit;

  Clock(this.limit);

  /// Update the clock's time. Returns the number of ticks performed.
  /// Optionally, pass a function that's called once for every tick.
  int update(num dt, [onTick()]) {
    time += dt;
    int ticks = 0;
    while (time >= limit) {
      time -= limit;
      ticks += 1;
      if (onTick != null) onTick();
    }
    return ticks;
  }
}
