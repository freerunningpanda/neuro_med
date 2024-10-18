library core;

import 'package:auto_route/auto_route.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/app_form_cubit/app_form_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/connection_checker/connection_checker_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/obscure_text_cubit/obscure_text_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/cubit/router_cubit/router_cubit.dart';
import 'package:upmind_front_client/core/common/presentation/router/app_router.dart';
import 'package:upmind_front_client/core/common/presentation/router/routers/auth_routes.dart';
import 'package:upmind_front_client/core/common/presentation/router/routers/main_routes.dart';
import 'package:upmind_front_client/core/common/presentation/router/routers/splash_routes.dart';
import 'package:upmind_front_client/core/common/presentation/theme/app_colors.dart';
import 'package:upmind_front_client/core/common/presentation/theme/app_theme.dart';
import 'package:upmind_front_client/core/common/presentation/theme/app_typo.dart';
import 'package:upmind_front_client/core/data/core_data.dart';
import 'package:upmind_front_client/core/data/database/drift/drift_database_impl.dart';
import 'package:upmind_front_client/core/network/network_info.dart';
import 'package:upmind_front_client/core/utils/constants/api_keys.dart';
import 'package:upmind_front_client/features/areas/data/datasources/local/area_local_datasource.dart';
import 'package:upmind_front_client/features/areas/data/datasources/local/area_local_datasource_impl.dart';
import 'package:upmind_front_client/features/areas/data/datasources/remote/area_remote_datasource.dart';
import 'package:upmind_front_client/features/areas/data/datasources/remote/area_remote_datasource_impl.dart';
import 'package:upmind_front_client/features/areas/data/repositories/area_repository_impl.dart';
import 'package:upmind_front_client/features/areas/domain/repositories/area_repository.dart';
import 'package:upmind_front_client/features/areas/domain/usecases/get_areas.dart';
import 'package:upmind_front_client/features/areas/presentation/bloc/areas_bloc.dart';
import 'package:upmind_front_client/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:upmind_front_client/features/auth/data/datasources/local/auth_local_datasource_impl.dart';
import 'package:upmind_front_client/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:upmind_front_client/features/auth/data/datasources/remote/auth_remote_datasource_impl.dart';
import 'package:upmind_front_client/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:upmind_front_client/features/auth/domain/repositories/auth_repository.dart';
import 'package:upmind_front_client/features/auth/domain/usecases/check_auth.dart';
import 'package:upmind_front_client/features/auth/domain/usecases/user_login.dart';
import 'package:upmind_front_client/features/auth/domain/usecases/user_logout.dart';
import 'package:upmind_front_client/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:upmind_front_client/features/products/data/datasources/local/products_local_datasource.dart';
import 'package:upmind_front_client/features/products/data/datasources/local/products_local_datasource_impl.dart';
import 'package:upmind_front_client/features/products/data/datasources/remote/products_remote_datasource.dart';
import 'package:upmind_front_client/features/products/data/datasources/remote/products_remote_datasource_impl.dart';
import 'package:upmind_front_client/features/products/data/repositories/products_repository_impl.dart';
import 'package:upmind_front_client/features/products/domain/repositories/products_repository.dart';
import 'package:upmind_front_client/features/products/domain/usecases/get_products.dart';
import 'package:upmind_front_client/features/products/domain/usecases/get_user_products.dart';
import 'package:upmind_front_client/features/products/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:upmind_front_client/features/products/presentation/bloc/user_products_bloc/user_products_bloc.dart';
import 'package:upmind_front_client/features/products/presentation/cubit/landscape_session_list/landscape_session_list_cubit.dart';
import 'package:upmind_front_client/features/products/presentation/cubit/session_item/session_item_cubit.dart';
import 'package:upmind_front_client/features/splash_screen/data/datasources/splash_screen_local_datasource/splash_screen_local_datasource.dart';
import 'package:upmind_front_client/features/splash_screen/data/datasources/splash_screen_local_datasource/splash_screen_local_datasource_impl.dart';
import 'package:upmind_front_client/features/splash_screen/data/repositories/splash_screen_repository_impl.dart';
import 'package:upmind_front_client/features/splash_screen/domain/repositories/splash_screen_repository.dart';
import 'package:upmind_front_client/features/splash_screen/domain/usecases/get_image_path.dart';
import 'package:upmind_front_client/features/splash_screen/presentation/cubit/splash_screen_cubit.dart';
import 'package:upmind_front_client/features/user_notifications/data/datasources/local/user_notifications_local_datasource.dart';
import 'package:upmind_front_client/features/user_notifications/data/datasources/local/user_notifications_local_datasource_impl.dart';
import 'package:upmind_front_client/features/user_notifications/data/datasources/remote/user_notifications_remote_datasource.dart';
import 'package:upmind_front_client/features/user_notifications/data/datasources/remote/user_notifications_remote_datasource_impl.dart';
import 'package:upmind_front_client/features/user_notifications/data/repositories/user_notifications_repository_impl.dart';
import 'package:upmind_front_client/features/user_notifications/domain/repositories/user_notifications_repository.dart';
import 'package:upmind_front_client/features/user_notifications/domain/usecases/get_user_notifications.dart';
import 'package:upmind_front_client/features/user_notifications/presentation/bloc/user_notifications_bloc.dart';
import 'package:upmind_front_client/features/user_notifications/presentation/cubit/notifications_switcher_cubit.dart';
import 'package:upmind_front_client/generated/l10n.dart';

part '../core/dependencies/injection_container.dart';
part 'utils/errors/exceptions.dart';
part 'utils/errors/failure.dart';
part 'utils/extensions/build_context_ext.dart';
part 'utils/logger/logger.dart';
part 'utils/repository/base_repository.dart';
