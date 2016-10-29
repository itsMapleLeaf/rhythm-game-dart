import 'dart:math';

final random = new Random();

/// Returns an integer between min and max (exclusive)
int intBetween(int min, int max) =>
  random.nextInt(max) + min;

/// Returns a double between min and max (exclusive)
double doubleBetween(num min, num max) =>
  random.nextDouble() * (max - min) + min;