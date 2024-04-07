import 'dart:typed_data';
import 'package:hive/hive.dart';

part 'plant_model.g.dart';

@HiveType(typeId: 1)
class Plant extends HiveObject {
  @HiveField(0)
  Uint8List image;
  @HiveField(1)
  Map<String, String>? variables;

  Plant(this.image, this.variables);
}
