import 'package:botanicabay/logic/localization/languages/en_lang.dart';
import 'package:botanicabay/logic/localization/languages/es_lang.dart';
import 'package:botanicabay/logic/localization/languages/ro_lang.dart';
import 'package:botanicabay/logic/localization/providers/language_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalizationHandler {
  String getMessage(WidgetRef ref, String id) {
    String locale = ref.watch(languageProvider);
    switch (locale) {
      case "en":
        return en[id] ?? "%undefined%";
      case "es":
        return es[id] ?? "%undefined%";
      case "ro":
        return ro[id] ?? "%undefined%";
    }
    return "";
  }
}
