import 'dart:math';

final random = new Random();

/// Returns an integer between min and max (exclusive)
int intRange(int min, int max) =>
  random.nextInt(max) + min;

/// Returns a double between min and max
double doubleRange(num min, num max) =>
  random.nextDouble() * (max - min) + min;