import 'package:palm_app/package.dart';

class AppColors {
  // Primary
  static const Color primary = Color(0xFF2879C0);
  static const Color primaryDark = Color(0xFF1A5A96);
  static const Color primaryLight = Color(0xFF5A9DDA);

  // Status (Light)
  static const Color present = Color(0xFF81D7A1);
  static const Color late = Color(0xFFF2B159);
  static const Color incomplete = Color(0xFFF18787);

  // Status (Dark)
  static const Color presentDark = Color(0xFF5CB85C);
  static const Color lateDark = Color(0xFFF0AD4E);
  static const Color incompleteDark = Color(0xFFD9534F);

  // Background (Light)
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Color(0xFFFFFFFF);

  // Background (Dark)
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);

  // Text (Light)
  static const Color textPrimary = Color(0xFF212529);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textHint = Color(0xFFADB5BD);
  static const Color textInverse = Color(0xFFFFFFFF);

  // Text (Dark)
  static const Color textPrimaryDark = Colors.white;
  static const Color textSecondaryDark = Color(0xFFBDBDBD); // Colors.grey[400]
  static const Color textHintDark = Color(0xFF757575); // Colors.grey[600]
  static const Color textInverseDark = Colors.black;

  // Borders & Dividers
  static const Color border = Color(0xFFE9ECEF);
  static const Color borderDark = Color(0xFF2C2C2C);
  
  // Error
  static const Color error = Color(0xFFE74C3C);
  static const Color errorDark = Color(0xFFCF6679);
}

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.primaryLight,
      surface: AppColors.surface,
      error: AppColors.error,
      onPrimary: AppColors.textInverse,
      onSecondary: AppColors.textInverse,
      onSurface: AppColors.textPrimary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textInverse,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.textInverse),
      titleTextStyle: TextStyle(
        color: AppColors.textInverse,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.primary, fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: AppColors.primary, fontSize: 28, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(color: AppColors.primary, fontSize: 24, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(color: AppColors.textPrimary, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 14),
      labelSmall: TextStyle(color: AppColors.textHint, fontSize: 12),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textInverse,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
    ),
    iconTheme: const IconThemeData(color: AppColors.textPrimary),
    dividerTheme: const DividerThemeData(
      color: AppColors.border,
      thickness: 1,
      space: 1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textInverse,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 2,
      shadowColor: const Color(0x1A000000),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textHint,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 16,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.primaryLight,
      surface: AppColors.surfaceDark,
      error: AppColors.errorDark,
      onPrimary: AppColors.textInverseDark,
      onSecondary: AppColors.textInverseDark,
      onSurface: AppColors.textPrimaryDark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      foregroundColor: AppColors.textPrimaryDark,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.textPrimaryDark),
      titleTextStyle: TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.primaryLight, fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: AppColors.primaryLight, fontSize: 28, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(color: AppColors.primaryLight, fontSize: 24, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: AppColors.textPrimaryDark, fontSize: 18, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(color: AppColors.textPrimaryDark, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.textSecondaryDark, fontSize: 14),
      labelSmall: TextStyle(color: AppColors.textHintDark, fontSize: 12),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textInverse,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
    ),
    iconTheme: const IconThemeData(color: AppColors.textPrimaryDark),
    dividerTheme: const DividerThemeData(
      color: AppColors.borderDark,
      thickness: 1,
      space: 1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textInverse,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surfaceDark,
      elevation: 2,
      shadowColor: const Color(0x33000000), 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surfaceDark,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textHintDark,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 16,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    ),
  );
}

extension ThemeColorsExt on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Color get backgroundColor => isDarkMode ? AppColors.backgroundDark : AppColors.background;
  Color get surfaceColor => isDarkMode ? AppColors.surfaceDark : AppColors.surface;
  
  Color get textPrimary => isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimary;
  Color get textSecondary => isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondary;
  Color get textHint => isDarkMode ? AppColors.textHintDark : AppColors.textHint;
  Color get textBlue => isDarkMode ? AppColors.primaryLight : AppColors.primary;
  Color get textInverse => isDarkMode ? AppColors.textInverseDark : AppColors.textInverse;

  Color get borderColor => isDarkMode ? AppColors.borderDark : AppColors.border;
  Color get dividerColor => isDarkMode ? AppColors.borderDark : AppColors.border;

  Color get presentColor => isDarkMode ? AppColors.presentDark : AppColors.present;
  Color get lateColor => isDarkMode ? AppColors.lateDark : AppColors.late;
  Color get incompleteColor => isDarkMode ? AppColors.incompleteDark : AppColors.incomplete;

  Color get primaryColor => AppColors.primary;
  Color get primaryDark => AppColors.primaryDark;
  Color get primaryLight => AppColors.primaryLight;
  Color get errorColor => isDarkMode ? AppColors.errorDark : AppColors.error;
}
