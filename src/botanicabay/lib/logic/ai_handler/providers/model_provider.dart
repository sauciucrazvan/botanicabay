import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:botanicabay/logic/settings_logic/settings_handler.dart';

final modelProvider = StateProvider<String>((ref) {
  SettingsHandler settingsHandler = SettingsHandler();
  return settingsHandler.getValue('openai_model') ?? "gpt-3.5-turbo";
});
