import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:botanicabay/logic/settings_logic/settings_handler.dart';

final showPreviewProvider = StateProvider<bool>((ref) {
  SettingsHandler settingsHandler = SettingsHandler();
  return settingsHandler.getValue('show_preview') ?? false;
});
