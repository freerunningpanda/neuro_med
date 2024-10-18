import 'package:equatable/equatable.dart';
import 'package:upmind_front_client/features/products/presentation/utils/status.dart';

class UserVideo extends Equatable {
  const UserVideo({
    required this.id,
    required this.kinescopeId,
    required this.name,
    required this.status,
    this.viewProgress,
  });

  final int id;
  final String kinescopeId;
  final String name;
  final Status status;
  final double? viewProgress;

  @override
  List<Object?> get props => [
        id,
        kinescopeId,
        name,
        status,
        viewProgress,
      ];
}
