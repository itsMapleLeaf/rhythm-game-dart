/// Linearly interpolates between a and b with a given delta
///
/// ex: lerp(1, 3, 0.5) == 2
num lerp(num a, num b, num delta) => a + (b - a) * delta.clamp(0, 1);