import 'package:flutter/material.dart';

class CustomColors {
  static const Color primaryColor = Color.fromRGBO(26, 181, 228, 1);
  static const Color secondaryColor = Color.fromRGBO(126, 239, 204, 1);
}

// Note: Use https://maketintsandshades.com/#1ab5e4 to generate any palette
class Palette {
  static const MaterialColor primarySwatch = MaterialColor(
    0xff1ab5e4,
    <int, Color>{
      50: Color(0xff31bce7),
      100: Color(0xff17a3cd),
      200: Color(0xff1591b6),
      300: Color(0xff127fa0),
      400: Color(0xff106d89),
      500: Color(0xff0d5b72),
      600: Color(0xff0a485b),
      700: Color(0xff083644),
      800: Color(0xff05242e),
      900: Color(0xff000000),
    },
  );
}

class Themes {
  static ButtonStyle buttonsCommonTheme = ButtonStyle(
    shape: MaterialStateProperty.all(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    ),
  );

  static final ThemeData defaultTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Monstserrat",
    primarySwatch: Palette.primarySwatch,
    primaryColor: CustomColors.secondaryColor,
    canvasColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: buttonsCommonTheme.copyWith(),
    ),
    textButtonTheme: TextButtonThemeData(
      style: buttonsCommonTheme.copyWith(),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: buttonsCommonTheme.copyWith(),
    ),
  );
}
