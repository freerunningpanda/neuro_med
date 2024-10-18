import 'package:equatable/equatable.dart';

class Area extends Equatable {
  const Area({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
  });

  final int id;
  final String name;
  final String description;
  final String thumbnail;

  @override
  List<Object> get props => [
        id,
        name,
        description,
        thumbnail,
      ];
}
