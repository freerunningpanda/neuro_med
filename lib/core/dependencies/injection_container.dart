part of '../core.dart';

final sl = GetIt.asNewInstance();
late final SharedPreferences _prefs;
late final FlutterSecureStorage _secureStorage;

Future<void> dependencyInjectionsInit() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiKeys.httpHostDev,
      sendTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      // contentType: 'application/json',
      // Настройка validateStatus для обработки редиректов
      validateStatus: (status) => status == 302 || status == 200,
    ),
  );

  final cookieJar = CookieJar();

  _prefs = await SharedPreferences.getInstance();
  _secureStorage = const FlutterSecureStorage();

  sl
    // Utils.
    ..registerLazySingleton<DriftDatabaseImpl>(DriftDatabaseImpl.new)
    ..registerLazySingleton<SharedPreferences>(() => _prefs)
    ..registerLazySingleton<FlutterSecureStorage>(() => _secureStorage)
    ..registerLazySingleton<Dio>(() => dio)
    ..registerLazySingleton<CookieJar>(() => cookieJar);

  // Logger init dependency.
  _initLogger();

  // Splash init dependency.
  _initSplashScreen();

  // Auth init dependency.
  _initAuth();

  // ConnectionChecker init dependency.
  _initConnectionChecker();

  // Router init dependency.
  _initRouter();

  // Theme init dependency.
  _initTheme();

  // ObscureTextCubit init dependency.
  _initObscureText();

  // NotificationsCubit init dependency.
  _initNotifications();

  // Products init dependency.
  _initProducts();

  // AppFormCubit init dependency.
  _initAppForm();

  // Areas init dependency.
  _initAreas();

  dio.interceptors
    ..add(AppInterceptor(logger: sl()))
    ..add(CookieManager(cookieJar))
    ..add(CookieInterceptor(sl(), sl()))
    ..add(sl<TalkerDioLogger>())
    ..add(
      RedirectInterceptor(
        sl(),
        logger: sl(),
      ),
    );
}

void _initNotifications() {
  sl
    ..registerFactory<NotificationsSwitcherCubit>(
      NotificationsSwitcherCubit.new,
    )
    ..registerFactory<UserNotificationsBloc>(
      () => UserNotificationsBloc(sl()),
    )

    // UseCases.
    ..registerLazySingleton<GetUserNotifications>(
      () => GetUserNotifications(
        sl(),
      ),
    )

    // Repositories.
    ..registerLazySingleton<UserNotificationsRepository>(
      () => UserNotificationsRepositoryImpl(
        sl(),
        sl(),
        sl(),
        logger: sl(),
      ),
    )

    // Data sources.
    ..registerLazySingleton<UserNotificationsLocalDatasource>(
      () => UserNotificationsLocalDatasourceImpl(sl()),
    )
    ..registerLazySingleton<UserNotificationsRemoteDatasource>(
      () => UserNotificationsRemoteDatasourceImpl(
        sl(),
        sl(),
      ),
    );
}

void _initAreas() {
  sl
    ..registerFactory<AreasBloc>(
      () => AreasBloc(sl()),
    )

    // UseCases.
    ..registerLazySingleton<GetAreas>(() => GetAreas(sl()))

    // Repositories.
    ..registerLazySingleton<AreaRepository>(
      () => AreaRepositoryImpl(
        sl(),
        sl(),
        sl(),
        logger: sl(),
      ),
    )

    // Data sources.
    ..registerLazySingleton<AreaLocalDatasource>(
      () => AreaLocalDatasourceImpl(sl()),
    )
    ..registerLazySingleton<AreaRemoteDatasource>(
      () => AreaRemoteDatasourceImpl(sl(), sl()),
    );
}

void _initProducts() {
  sl
    ..registerFactory<ProductsBloc>(
      () => ProductsBloc(sl()),
    )
    ..registerFactory<UserProductsBloc>(
      () => UserProductsBloc(sl()),
    )
    ..registerFactory<SessionItemCubit>(
      SessionItemCubit.new,
    )
    ..registerFactory<LandscapeSessionListCubit>(
      LandscapeSessionListCubit.new,
    )
    // UseCases.
    ..registerLazySingleton<GetProducts>(() => GetProducts(sl()))
    ..registerLazySingleton<GetUserProducts>(() => GetUserProducts(sl()))

    // Repositories.
    ..registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(
        sl(),
        sl(),
        sl(),
        logger: sl(),
      ),
    )

    // Data sources.
    ..registerLazySingleton<ProductsLocalDatasource>(
      () => ProductsLocalDatasourceImpl(sl()),
    )
    ..registerLazySingleton<ProductsRemoteDatasource>(
      () => ProductsRemoteDatasourceImpl(sl(), sl()),
    );
}

void _initLogger() {
  sl
    ..registerLazySingleton<IAppLogger>(() => AppLogger(talker: sl()))
    ..registerLazySingleton<Talker>(TalkerFlutter.init)
    ..registerLazySingleton<TalkerDioLogger>(
      () => TalkerDioLogger(
        talker: sl(),
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
        ),
      ),
    )
    ..registerLazySingleton<TalkerBlocObserver>(
      () => TalkerBlocObserver(
        talker: sl(),
        settings: const TalkerBlocLoggerSettings(
          printChanges: true,
          printCreations: true,
          printClosings: true,
          printStateFullData: false,
        ),
      ),
    );
}

void _initRouter() {
  sl
    ..registerLazySingleton<AppRouter>(
      () => AppRouter(
        splashRouters: sl(),
        mainRouters: sl(),
        authRouters: sl(),
      ),
    )
    ..registerLazySingleton<SplashRouters>(SplashRouters.new)
    ..registerLazySingleton<MainRouters>(MainRouters.new)
    ..registerLazySingleton<AuthRouters>(AuthRouters.new)
    ..registerLazySingleton<RouterCubit>(RouterCubit.new);
}

void _initTheme() {
  sl
    ..registerLazySingleton<AppTheme>(
      () => AppTheme(
        colors: sl(),
        typography: sl(),
      ),
    )
    ..registerLazySingleton<AppColors>(AppColors.new)
    ..registerLazySingleton<AppTypo>(AppTypo.new);
}

void _initSplashScreen() {
  sl
    ..registerLazySingleton<SplashScreenCubit>(
      () => SplashScreenCubit(sl()),
    )

    // UseCases.
    ..registerLazySingleton<GetImagePath>(() => GetImagePath(sl()))

    // Repositories.
    ..registerLazySingleton<SplashScreenRepository>(
      () => SplashScreenRepositoryImpl(
        sl(),
        logger: sl(),
      ),
    )

    // Data sources.
    ..registerLazySingleton<SplashScreenLocalDatasource>(
      () => SplashScreenLocalDatasourceImpl(sl()),
    );
}

void _initAuth() {
  sl
    ..registerFactory<AuthBloc>(
      () => AuthBloc(
        sl(),
        sl(),
        sl(),
      ),
    )

    // UseCases.
    ..registerLazySingleton<UserLogin>(() => UserLogin(sl()))
    ..registerLazySingleton<UserLogout>(() => UserLogout(sl()))
    ..registerLazySingleton<CheckAuth>(() => CheckAuth(sl()))

    // Repositories.
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        sl(),
        sl(),
        sl(),
        logger: sl(),
      ),
    )

    // Data sources.
    ..registerLazySingleton<AuthLocalDatasource>(
      () => AuthLocalDatasourceImpl(sl()),
    )
    ..registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(sl(), sl(), sl()),
    );
}

void _initConnectionChecker() {
  sl
    ..registerLazySingleton<ConnectionCheckerCubit>(
      () => ConnectionCheckerCubit(
        sl(),
      ),
    )
    ..registerLazySingleton<InternetConnectionChecker>(
      InternetConnectionChecker.createInstance,
    )
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(
        sl(),
      ),
    );
}

void _initObscureText() {
  sl.registerFactory<ObscureTextCubit>(
    ObscureTextCubit.new,
  );
}

void _initAppForm() {
  sl.registerFactory<AppFormCubit>(
    AppFormCubit.new,
  );
}
