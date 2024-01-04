import 'dart:ui';

class AppColors {
  static const Color texteColor = Color(0xB3000000);
  static const Color texteDarkColor = Color(0xFF000000);
  static const Color primaryColor = Color(0xFF005025);
  static const Color secondaryColor = Color(0xFF6bc0b0);
  static const Color accentColor = Color(0xFF00BF58);
  // Ajoutez autant de couleurs que nécessaire

  // Méthode pour convertir une chaîne hexadécimale en objet Color
  static Color hexToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}