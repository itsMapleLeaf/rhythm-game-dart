class Clock {
  num time = 0;
  final num limit;

  Clock(this.limit);

  int update(num dt, [onTick]) {
    time += dt;
    num ticks = 0;
    while (time > limit) {
      time -= limit;
      ticks += 1;
      onTick();
    }
    return ticks;
  }
}