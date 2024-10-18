library core_data;

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/auth/domain/repositories/auth_repository.dart';

part '../network/handlers/request_handler.dart';
part '../network/interceptors/app_interceptor.dart';
part '../network/interceptors/cookie_interceptor.dart';
part '../network/interceptors/redirect_interceptor.dart';
