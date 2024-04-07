import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final plantsProvider = StateProvider<Map>((ref) {
  return Hive.box('plants').toMap();
});
