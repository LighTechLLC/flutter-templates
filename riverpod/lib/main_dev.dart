import 'package:flutter/material.dart';
import 'package:flutter_app_environment/flutter_app_environment.dart';
import 'package:flutter_template_riverpod/common/env/environment_config.dart';
import 'package:flutter_template_riverpod/common/runner.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Environment.initFromJson<EnvironmentConfig>(
    environmentType: EnvironmentType.development,
    fromJson: EnvironmentConfig.fromJson,
  );

  await run();
}
