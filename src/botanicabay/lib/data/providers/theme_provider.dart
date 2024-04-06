import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:botanicabay/data/models/themes_model.dart';
import 'package:botanicabay/presentation/themes/dark_theme.dart';
import 'package:botanicabay/presentation/themes/green_theme.dart';
import 'package:botanicabay/presentation/themes/light_theme.dart';
import 'package:botanicabay/logic/settings_logic/settings_handler.dart';

final themesProvider = StateProvider<Themes>((ref) {
  SettingsHandler settingsHandler = SettingsHandler();
  String theme = settingsHandler.isInitialized()
      ? settingsHandler.getValue('app_theme')
      : "dark";

  switch (theme) {
    case "light":
      return LightTheme();
    case "green":
      return GreenTheme();
    default:
      return DarkTheme();
  }
});
