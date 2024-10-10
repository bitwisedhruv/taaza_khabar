import 'package:flutter/material.dart';

class AppPalette {
  static const Color blueColor = Color(0xff0c54be);
  static const Color darkBlueColor = Color(0xff303f60);
  static const Color lightGreyColor = Color(0xfff5f9fd);
  static const Color darkGreyColor = Color(0xffced3dc);

  static final _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ));
  static final theme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: lightGreyColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: lightGreyColor,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: _border,
        focusedBorder: _border,
        filled: true,
        fillColor: Colors.white,
      ));
}
