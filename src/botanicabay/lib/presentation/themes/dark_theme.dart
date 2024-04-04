import 'package:flutter/material.dart';
import 'package:botanicabay/data/models/themes_model.dart';

class DarkTheme extends Themes {
  @override
  Color get primaryColor => const Color(0xFF00A170);

  @override
  Color get secondaryColor => const Color.fromARGB(255, 48, 45, 45);

  @override
  Color get focusColor => const Color(0xFF36454F);

  @override
  Color get backgroundColor => const Color(0xFF121212);

  @override
  Color get textColor => const Color(0xEDEDEDED);

  @override
  ThemeType get themeType => ThemeType.dark;
}
