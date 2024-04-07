import 'package:botanicabay/logic/localization/languages/it_lang.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:botanicabay/logic/localization/languages/de_lang.dart';
import 'package:botanicabay/logic/localization/languages/en_lang.dart';
import 'package:botanicabay/logic/localization/languages/es_lang.dart';
import 'package:botanicabay/logic/localization/languages/fr_lang.dart';
import 'package:botanicabay/logic/localization/languages/ro_lang.dart';

import 'package:botanicabay/logic/localization/providers/language_provider.dart';

class LocalizationHandler {
  String getMessage(WidgetRef ref, String id) {
    String locale = ref.watch(languageProvider);
    switch (locale) {
      case "de":
        return de[id] ?? "%undefined%";
      case "en":
        return en[id] ?? "%undefined%";
      case "es":
        return es[id] ?? "%undefined%";
      case "fr":
        return fr[id] ?? "%undefined%";
      case "it":
        return it[id] ?? "%undefined%";
      case "ro":
        return ro[id] ?? "%undefined%";
    }
    return "%undefined%";
  }
}
