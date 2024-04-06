import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:botanicabay/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Opening the databases
  await Hive.openBox('plants');
  await Hive.openBox('settings');

  runApp(const ProviderScope(child: BotanicaBay()));
}
