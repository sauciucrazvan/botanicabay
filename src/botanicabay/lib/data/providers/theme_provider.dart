import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:botanicabay/data/models/themes_model.dart';
import 'package:botanicabay/presentation/themes/dark_theme.dart';

final themesProvider = StateProvider<Themes>((ref) {
  return DarkTheme();
});
