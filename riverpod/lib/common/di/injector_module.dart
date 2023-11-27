import 'package:dio/dio.dart';
import 'package:flutter_app_environment/flutter_app_environment.dart' as env;
import 'package:flutter_template_riverpod/common/env/environment_config.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectorModule {
  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  EnvironmentConfig get config =>
      env.Environment<EnvironmentConfig>.instance().config;

  @singleton
  Dio dio(EnvironmentConfig config) =>
      Dio(BaseOptions(baseUrl: config.baseUrl));
}
