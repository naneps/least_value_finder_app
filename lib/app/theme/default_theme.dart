import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class DefaultTheme {
  static Color primaryColor = Color.fromARGB(255, 112, 136, 254);
  static Color secondaryColor = Color.fromARGB(255, 48, 73, 202);
  static Color darkColor = Color.fromARGB(255, 55, 55, 55);
  static Color lightColor = Color.fromARGB(255, 240, 240, 240);
  static Color accentColor = Color.fromARGB(255, 255, 237, 149);
  static Color errorColor = Color.fromARGB(255, 255, 149, 149);
  static Color successColor = Color.fromARGB(255, 149, 255, 161);
  static Color warningColor = Color.fromARGB(255, 255, 220, 149);
  static Color infoColor = Color.fromARGB(255, 149, 163, 255);

  static Color primaryTextColor = Color.fromARGB(255, 51, 55, 55);
  static Color secondaryTextColor = Color.fromARGB(255, 112, 136, 254);
  static Color darkTextColor = Color.fromARGB(255, 55, 55, 55);
  static Color lightTextColor = Color.fromARGB(255, 240, 240, 240);
  static Color accentTextColor = Color.fromARGB(255, 255, 237, 149);
  static Color errorTextColor = Color.fromARGB(255, 255, 149, 149);
  static Color successTextColor = Color.fromARGB(255, 149, 255, 161);
  static Color warningTextColor = Color.fromARGB(255, 255, 220, 149);

  static ThemeData defaultTheme = ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: darkColor,
    primaryColorLight: lightColor,
    errorColor: errorColor,
    backgroundColor: lightColor,
    scaffoldBackgroundColor: lightColor,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: primaryTextColor,
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      headline2: TextStyle(
        color: primaryTextColor,
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      headline3: TextStyle(
        color: primaryTextColor,
        fontSize: 48,
        fontWeight: FontWeight.w400,
      ),
      headline4: TextStyle(
        color: primaryTextColor,
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        color: primaryTextColor,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      headline6: TextStyle(
        color: primaryTextColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      subtitle1: TextStyle(
        color: primaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      ),
      subtitle2: TextStyle(
        color: primaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyText1: TextStyle(
        color: primaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyText2: TextStyle(
        color: primaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      button: TextStyle(
        color: primaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
      ),
      caption: TextStyle(
        color: primaryTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      overline: TextStyle(
        color: primaryTextColor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: errorColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: errorColor,
        ),
      ),
      labelStyle: TextStyle(
        color: primaryColor,
      ),
      errorStyle: TextStyle(
        color: errorColor,
      ),
      suffixIconColor: secondaryColor,
      suffixStyle: TextStyle(
        color: secondaryColor,
      ),
      prefixIconColor: secondaryColor,
      prefixStyle: TextStyle(
        color: secondaryColor,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: lightTextColor,
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
