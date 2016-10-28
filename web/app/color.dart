/// Utility class for working with colors
///
/// Internally, uses RGBA in 0-1 range
class Color {
  final num r, g, b, a;

  const Color(this.r, this.g, this.b, [this.a = 1]);

  /// Returns a new color with its RGB multiplied by a given value
  Color multiply(num v) {
    return new Color(r * v, g * v, b * v, a);
  }

  /// Returns a new color with its alpha multiplied by a given value
  Color opacity(num v) {
    return new Color(r, g, b, a * v);
  }

  /// Darkens the color by a given amount
  Color darken(num v) {
    return multiply(1 - v);
  }

  /// Converts the color to a string in rgb(...) format,
  /// or rgba(...) when alpha != 1
  String toString() {
    final _r = (r * 255).round();
    final _g = (g * 255).round();
    final _b = (b * 255).round();
    if (a == 1) {
      return 'rgb($_r, $_g, $_b)';
    } else {
      return 'rgba($_r, $_g, $_b, $a)';
    }
  }
}

/// Returns a color from RGB range 0-255 and alpha range 0-1
///
/// Example: rgb(50, 50, 255, 0.5) -> a nice semi-transparent blue
Color rgb(r, g, b, [a = 1]) {
  return new Color(r / 255, g / 255, b / 255, a);
}

final Color White = rgb(255, 255, 255);
final Color Black = rgb(0, 0, 0);

// http://flatuicolors.com/
final Color SeaGreen = rgb(26, 188, 156);
final Color Green = rgb(46, 204, 113);
final Color Blue = rgb(52, 152, 219);
final Color Violet = rgb(155, 89, 182);
final Color Yellow = rgb(241, 196, 15);
final Color Orange = rgb(230, 126, 34);
final Color Red = rgb(231, 76, 60);
final Color Asphalt = rgb(52, 73, 94);
final Color Cloudy = rgb(236, 240, 241);
final Color Gray = rgb(149, 165, 166);