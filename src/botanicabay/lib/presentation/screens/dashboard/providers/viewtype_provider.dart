import 'package:botanicabay/presentation/screens/dashboard/models/viewtype_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewTypeProvider = StateProvider<ViewType>((ref) {
  return ViewType.list;
});
