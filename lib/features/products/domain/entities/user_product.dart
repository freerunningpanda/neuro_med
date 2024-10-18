import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:upmind_front_client/features/products/domain/entities/user_video.dart';
import 'package:upmind_front_client/features/products/presentation/utils/status.dart';

class UserProduct extends Equatable {
  const UserProduct({
    required this.name,
    required this.length,
    required this.passed,
    required this.status,
    required this.thumbnail,
    required this.videos,
    this.endDate,
  });

  final String name;
  final int length;
  final int passed;
  final Status status;
  final String thumbnail;
  final String? endDate;
  final IList<UserVideo> videos;

  @override
  List<Object?> get props => [
        name,
        length,
        passed,
        status,
        thumbnail,
        endDate,
        videos,
      ];
}
