import 'package:flutter/material.dart';

const primaryColor = Color.fromARGB(255, 28, 54, 183);

const secondaryColor = Color.fromARGB(255, 249, 253, 253);
const secondaryColorDark = Color.fromARGB(255, 250, 250, 255);

const background = Color.fromARGB(255, 239, 241, 251);
const textColor = Color(0xFFffffff);

class MyTheme {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
        disabledColor: secondaryColor,
        primaryColor: primaryColor,
        buttonTheme: base.buttonTheme.copyWith(
          buttonColor: secondaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
        scaffoldBackgroundColor: background,
        cardColor: secondaryColorDark,
        colorScheme: base.colorScheme.copyWith(
          background: background,
        ));
  }
}
