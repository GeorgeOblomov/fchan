import 'package:flutter/material.dart';

final themeLight = _themeData(
  Brightness.light,
  Colors.orangeAccent,
  appBarColor: Color(0xFFB7C4D9),
  backgroundColor: Color(0xFFE4E8F9),
);

final themeDark = _themeData(
  Brightness.dark,
  Colors.orangeAccent,
);

ThemeData _themeData(
  Brightness brightness,
  Color accentColor, {
  Color appBarColor,
  Color backgroundColor,
}) {
  return ThemeData(
    brightness: brightness,
    accentColor: accentColor,
    appBarTheme: AppBarTheme(
      color: appBarColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: accentColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: accentColor,
    ),
    backgroundColor: backgroundColor,
  );
}
