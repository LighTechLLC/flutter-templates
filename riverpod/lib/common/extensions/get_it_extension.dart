import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

extension GetItExtension on GetIt {
  void registerBasedOnBuildType<T extends Object>(
    T Function() registerFunction,
  ) {
    if (kDebugMode) {
      registerLazySingleton<T>(() => registerFunction());
    } else {
      registerFactory<T>(() => registerFunction());
    }
  }
}
