import 'package:get_it/get_it.dart';
import 'package:hti_library_admin/core/network/local/cache_helper.dart';
import 'package:hti_library_admin/core/network/remote/dio_helper.dart';
import 'package:hti_library_admin/core/network/repository.dart';
import 'package:hti_library_admin/core/util/cubit/cubit.dart';

import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => MainCubit(
      repository: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<Repository>(
    () => RepoImplementation(
      dioHelper: sl(),
      cacheHelper: sl(),
    ),
  );

  //! Core
  sl.registerLazySingleton<DioHelper>(
    () => DioImpl(),
  );

  sl.registerLazySingleton<CacheHelper>(
    () => CacheImpl(
      sl(),
    ),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
