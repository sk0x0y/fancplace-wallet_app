import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  // Logger
  // getIt.registerLazySingleton<LoggingInterface>(() => LoggerService.instance);

  /// Dio
  // getIt.registerLazySingleton<Dio>(
  //   () => RequestBuilder.getInstance(),
  //   instanceName: 'client',
  // );

  /// Api
  // getIt.registerLazySingleton<SignupApi>(
  //   () => SignupApi(getIt<Dio>(instanceName: 'client')),
  // );

  /// Service
  // getIt.registerLazySingleton<SignupService>(
  //   () => SignupService(getIt<SignupApi>()),
  // );
}
