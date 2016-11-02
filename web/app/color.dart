/// Utility class for working with colors
/// Internally, uses RGBA in 0-1 range
class Color {
  final num r, g, b, a;

  Color(this.r, this.g, this.b, [this.a = 1]);

  /// Returns a new color with its RGB multiplied by a given value
  Color multipliedBy(num value) {
    return new Color(r * value, g * value, b * value, a);
  }

  /// Returns a new color with its alpha multiplied by a given value
  Color withOpacity(num opacity) {
    return new Color(r, g, b, a * opacity);
  }

  /// Darkens the color by a given amount
  Color darkenedBy(num darkness) {
    return new Color(
      r - r * darkness,
      g - g * darkness,
      b - b * darkness,
      a,
    );
  }

  /// Lightens the color by a given amount
  Color lightenedBy(num lightness) {
    return new Color(
      r + (1 - r) * lightness,
      g + (1 - g) * lightness,
      b + (1 - b) * lightness,
      a,
    );
  }

  /// Converts the color to a string in rgb(...) format,
  /// or rgba(...) when alpha != 1
  String toString() {
    final r = (this.r * 255).round();
    final g = (this.g * 255).round();
    final b = (this.b * 255).round();
    if (a == 1) {
      return 'rgb($r, $g, $b)';
    } else {
      return 'rgba($r, $g, $b, $a)';
    }
  }

  /// Returns a color from RGB range 0-255 and alpha range 0-1
  /// Example: rgb(50, 50, 255, 0.5) -> a nice semi-transparent blue
  Color.fromRGB(num r, num g, num b, [this.a = 1])
    : r = r / 255,
      g = g / 255,
      b = b / 255;

  static final Color white = new Color.fromRGB(255, 255, 255);
  static final Color black = new Color.fromRGB(0, 0, 0);

  // http://flatuicolors.com/
  static final Color seaGreen = new Color.fromRGB(26, 188, 156);
  static final Color green = new Color.fromRGB(46, 204, 113);
  static final Color blue = new Color.fromRGB(52, 152, 219);
  static final Color violet = new Color.fromRGB(155, 89, 182);
  static final Color yellow = new Color.fromRGB(241, 196, 15);
  static final Color orange = new Color.fromRGB(230, 126, 34);
  static final Color red = new Color.fromRGB(231, 76, 60);
  static final Color asphalt = new Color.fromRGB(52, 73, 94);
  static final Color cloudy = new Color.fromRGB(236, 240, 241);
  static final Color gray = new Color.fromRGB(149, 165, 166);
}
