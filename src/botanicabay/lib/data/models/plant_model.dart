import 'dart:typed_data';

import 'package:hive/hive.dart';

class Plant {
  final plantsDatabase = Hive.box('plants');

  String name;
  Uint8List image;
  Map<String, String>? variables;

  Plant(this.name, this.image, this.variables);

  String getName() => name;
  Uint8List getImage() => image;
  Map? getVariables() => variables;

  bool exists() => plantsDatabase.containsKey(name);

  void insert() {
    plantsDatabase.put(name, {
      "createdAt": DateTime.now().toIso8601String(),
      "image": image,
      "variables": variables,
    });
  }
}
