import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_riverpod/common/app.dart';
import 'package:flutter_template_riverpod/common/di/injector_configurator.dart';
import 'package:flutter_template_riverpod/common/providers/provider_logger.dart';
import 'package:flutter_template_riverpod/todo/models/todo_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> run() async {
  await configureDependencies();

  await Hive.initFlutter();
  Hive.registerAdapter(TodoHiveAdapter());

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  _runApp();
}

void _runApp() {
  runApp(ProviderScope(
    observers: [ProviderLogger()],
    child: const App(),
  ));
}
