import 'package:upmind_front_client/features/areas/domain/entities/area.dart';

class AreaModel extends Area {
  const AreaModel({
    required super.id,
    required super.name,
    required super.description,
    required super.thumbnail,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      thumbnail: json['thumbnail'] as String,
    );
  }
}
