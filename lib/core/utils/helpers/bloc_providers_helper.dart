// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:upmind_front_client/core/core.dart';
import 'package:upmind_front_client/features/products/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:upmind_front_client/features/products/presentation/bloc/user_products_bloc/user_products_bloc.dart';
import 'package:upmind_front_client/features/user_notifications/presentation/bloc/user_notifications_bloc.dart';

class NavigationScreenBlocProviders {
  factory NavigationScreenBlocProviders() => instance;
  NavigationScreenBlocProviders._();

  static NavigationScreenBlocProviders instance =
      NavigationScreenBlocProviders._();

  final List<SingleChildWidget> providers = [
    BlocProvider(create: (_) => sl<ProductsBloc>()),
    BlocProvider(create: (_) => sl<UserProductsBloc>()),
    BlocProvider(create: (_) => sl<UserNotificationsBloc>()),
  ];
}
