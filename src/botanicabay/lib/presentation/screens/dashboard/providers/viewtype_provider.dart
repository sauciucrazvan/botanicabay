import 'package:botanicabay/logic/settings_logic/settings_handler.dart';
import 'package:botanicabay/presentation/screens/dashboard/models/viewtype_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewTypeProvider = StateProvider<ViewType>((ref) {
  SettingsHandler settingsHandler = SettingsHandler();
  switch (settingsHandler.getValue('plants_viewtype')) {
    case "grid":
      return ViewType.grid;
    default:
      return ViewType.list;
  }
});
