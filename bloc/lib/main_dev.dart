import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_bloc/common/debug_bloc_observer.dart';
import 'package:template_bloc/common/env/build_type.dart';
import 'package:template_bloc/common/env/config.dart';
import 'package:template_bloc/common/env/debug_options.dart';
import 'package:template_bloc/common/env/environment.dart';
import 'package:template_bloc/common/logger/dev_logger.dart';
import 'package:template_bloc/common/runner.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Environment.init(
    buildType: BuildType.dev,
    config: Config(
      logger: DevLogger(),
      title: 'ENV Flutter application template with Bloc state manager',
      debugOptions: const DebugOptions(),
    ),
  );

  Bloc.observer = DebugBlocObserver();
  run();
}
