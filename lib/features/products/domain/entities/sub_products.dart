import 'package:equatable/equatable.dart';

class SubProducts extends Equatable {
  const SubProducts({
    required this.name,
    required this.description,
    required this.thumbnail,
  });

  final String name;
  final String description;
  final String thumbnail;

  @override
  List<Object?> get props => [
        name,
        description,
        thumbnail,
      ];
}
