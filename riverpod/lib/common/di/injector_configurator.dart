import 'package:flutter_template_riverpod/common/di/injector_configurator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.init();
  await getIt.allReady();
}
