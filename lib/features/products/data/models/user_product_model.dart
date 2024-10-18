import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/features/products/data/models/user_video_model.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_product.dart';
import 'package:upmind_front_client/features/products/presentation/utils/status.dart';

class UserProductModel extends UserProduct {
  const UserProductModel({
    required this.id,
    required super.name,
    required super.length,
    required super.passed,
    required super.status,
    required super.thumbnail,
    required super.videos,
    required super.endDate,
  });

  factory UserProductModel.fromJson(Map<String, dynamic> json) {
    return UserProductModel(
      id: _generateId(),
      name: json['name'] as String,
      length: json['length'] as int,
      passed: json['passed'] as int,
      status: Status.parse(json['status'] as String),
      thumbnail: json['thumbnail'] as String,
      videos: (json['videos'] as List<dynamic>)
          .map((e) => UserVideoModel.fromJson(e as Map<String, dynamic>))
          .toIList(),
      endDate: json['end_date'] as String?,
    );
  }

  // TODO(freerunningpanda): Попросить отдавать с бэка id
  static int _generateId() => DateTime.now().millisecondsSinceEpoch;

  final int id;

  Map<String, dynamic> toJson() => {
        'name': name,
        'length': length,
        'passed': passed,
        'status': status,
        'thumbnail': thumbnail,
        'end_date': endDate,
      };
}
