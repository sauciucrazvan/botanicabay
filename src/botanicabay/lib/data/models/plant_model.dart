import 'package:hive/hive.dart';

class Plant {
  final plantsDatabase = Hive.box('plants');

  String name;
  Map<String, String>? variables;

  Plant(this.name, this.variables);

  String getName() => name;
  Map? getVariables() => variables;

  bool exists() => plantsDatabase.containsKey(name);

  void insert() {
    plantsDatabase.put(name, {
      "createdAt": DateTime.now().toIso8601String(),
      "variables": variables,
    });
  }
}
