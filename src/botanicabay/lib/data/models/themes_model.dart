import 'package:flutter/material.dart';

enum ThemeType {
  light,
  dark,
}

abstract class Themes {
  Color get primaryColor;
  Color get secondaryColor;
  Color get focusColor;
  Color get backgroundColor;
  Color get textColor;
  ThemeType get themeType;
}
