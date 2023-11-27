// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_template_riverpod/common/di/injector_module.dart'
    as _i6;
import 'package:flutter_template_riverpod/common/env/environment_config.dart'
    as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectorModule = _$InjectorModule();
    gh.singleton<_i3.EnvironmentConfig>(injectorModule.config);
    await gh.singletonAsync<_i4.SharedPreferences>(
      () => injectorModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i5.Dio>(injectorModule.dio(gh<_i3.EnvironmentConfig>()));
    return this;
  }
}

class _$InjectorModule extends _i6.InjectorModule {}
