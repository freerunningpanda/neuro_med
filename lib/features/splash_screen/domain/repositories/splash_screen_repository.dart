// ignore_for_file: one_member_abstracts

import 'package:either_dart/either.dart';
import 'package:upmind_front_client/core/core.dart';

abstract interface class SplashScreenRepository {
  Future<Either<Failure, String>> getImagePath();
}
