import 'package:flutter/material.dart';
import 'package:botanicabay/data/models/themes_model.dart';

class GreenTheme extends Themes {
  @override
  Color get primaryColor => const Color(0xFF00A170);

  @override
  Color get secondaryColor => const Color.fromARGB(131, 7, 121, 31);

  @override
  Color get focusColor => const Color.fromARGB(255, 31, 155, 38);

  @override
  Color get backgroundColor => const Color.fromARGB(131, 3, 122, 29);

  @override
  Color get textColor => const Color(0xEDEDEDED);

  @override
  ThemeType get themeType => ThemeType.light;
}
