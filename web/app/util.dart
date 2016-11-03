import 'dart:math' show Random;

final Random _rgen = new Random();

/// Linearly interpolates between a and b with a given delta
/// ex: lerp(1, 3, 0.5) == 2
num lerp(num a, num b, num delta) => a + (b - a) * delta.clamp(0, 1);

/// Find the delta of a value between a and b
/// ex: delta(2, 1, 3) == 0.5
num delta(num value, num a, num b) => a != b ? (value - a) / (b - a) : 0;

/// Return a random number between a and b
num random(num a, num b) => _rgen.nextDouble() * (b - a) + a;
