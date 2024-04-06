import 'package:hive/hive.dart';

class SettingsHandler {
  final settings = Hive.box("settings");

  bool isInitialized() {
    return Hive.isBoxOpen('settings');
  }

  dynamic getValue(String setting) {
    return settings.get(setting);
  }

  dynamic setValue(String setting, dynamic value) {
    return settings.put(setting, value);
  }
}
