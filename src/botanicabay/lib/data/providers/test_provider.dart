import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloWorldProvider = StateProvider<String>((ref) {
  return "Hello World!";
});
