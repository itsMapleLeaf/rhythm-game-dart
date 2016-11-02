import 'dart:math' show Random;

/// Linearly interpolates between a and b with a given delta
///
/// ex: lerp(1, 3, 0.5) == 2
num lerp(num a, num b, num delta) => a + (b - a) * delta.clamp(0, 1);

final Random _rgen = new Random();
/// Return a random number between a and b
num random(num a, num b) => _rgen.nextDouble() * (b - a) + a;
