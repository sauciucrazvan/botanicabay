import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:botanicabay/logic/settings_logic/settings_handler.dart';

final languageProvider = StateProvider<String>((ref) {
  SettingsHandler settingsHandler = SettingsHandler();
  return settingsHandler.getValue('app_language') ?? "en";
});
