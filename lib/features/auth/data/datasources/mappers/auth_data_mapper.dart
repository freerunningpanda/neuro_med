import 'package:upmind_front_client/features/auth/data/models/auth_data_model.dart';
import 'package:upmind_front_client/features/auth/domain/entities/auth_data.dart';

extension AuthDataFromModelMapper on AuthDataModel {
  AuthData toUIEntityData() => AuthData(cookie: cookie);
}
