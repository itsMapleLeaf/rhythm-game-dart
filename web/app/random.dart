import 'dart:math';

final random = new Random();

/// Returns an integer between min and max (inclusive)
int intRange(min, max) => random.nextInt(max) + min;

/// Returns a double between min and max
double doubleRange(min, max) => random.nextDouble() * (max - min) + min;