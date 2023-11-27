import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template_riverpod/common/di/injector_configurator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await getIt.init();
  await getIt.allReady();

  getIt<Dio>().interceptors.addAll([
    AwesomeDioInterceptor(logRequestTimeout: false),
  ]);
}
