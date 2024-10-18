import 'package:upmind_front_client/features/products/domain/entities/user_video.dart';
import 'package:upmind_front_client/features/products/presentation/utils/status.dart';

class UserVideoModel extends UserVideo {
  const UserVideoModel({
    required super.id,
    required super.kinescopeId,
    required super.name,
    required super.status,
    super.viewProgress,
  });

  factory UserVideoModel.fromJson(Map<String, dynamic> json) {
    return UserVideoModel(
      id: json['id'] as int,
      kinescopeId: json['kinescope_id'] as String,
      name: json['name'] as String,
      status: Status.parse(json['status'] as String),
      viewProgress: json['view_progress'] != null
          ? (json['view_progress'] as num).toDouble()
          : null,
    );
  }
}
