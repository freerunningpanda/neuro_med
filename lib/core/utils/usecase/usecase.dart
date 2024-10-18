import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:upmind_front_client/core/core.dart';

// ignore: one_member_abstracts
abstract class UseCase<Type, Params> {
  const UseCase();

  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
